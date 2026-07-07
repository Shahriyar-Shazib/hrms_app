# HRMS QA Report 2026-07-07

Scope: Laravel API (`hrms-api`, `php artisan serve --port=8001`, already running) exercised as the Flutter app would call it, cross-checked against the app's freezed models, routing, and permission gating. Live data on house "Mir Monjil" was treated as read-only except for the one explicitly-permitted due create/waive cycle.

## Summary: 30 passed / 0 failed / 2 skipped

(Counts are per assertion within sections A–M below, not per lettered section.)

## Critical issues (crash risks, model mismatches, permission mismatches)

1. **Server permission denials on nested house-scoped routes leak raw Laravel debug output instead of the `{error:{code,...}}` envelope, and the app's unwrap logic silently swallows it.**
   `GET /managers`, `GET /houses/{h}/managers`, `GET /houses/{h}/bill-configs` as `mgr1` all return HTTP 403 with body `{"message":"This action is unauthorized.","exception":"...AccessDeniedHttpException","file":...,"trace":[...]}` — no `error` key, full server file paths exposed (APP_DEBUG=true). The app's `unwrapData()` ([api_envelope.dart:5](lib/core/api/api_envelope.dart#L5)) only throws `ApiException` when json contains `error`; for this response shape it falls through to `return json['data']`, which is `null`. Any code path that reaches one of these endpoints without the app's own UI gating (e.g. a future role change, or a bug in `canProvider`) would receive a silent `null` instead of a `FORBIDDEN` error — a crash risk wherever the caller assumes a `List`. Currently masked because the app's local permission sets happen to hide these screens from managers (see #2, #3), so this is latent rather than currently triggered.

2. **App hides the Reports screen from managers even though the server allows it.**
   `mgr1`'s real `/auth/me` permissions include `report.view`, and `GET /houses/{h}/reports/pnl` returns 200 for `mgr1`. But `current_user_provider.dart`'s hardcoded `managerPermissions` set ([current_user_provider.dart:42-54](lib/core/auth/current_user_provider.dart#L42-L54)) omits `report.view`, so `canProvider('report.view')` is `false` for managers and the Reports button never renders in [house_detail_screen.dart:145](lib/features/houses/presentation/house_detail_screen.dart#L145).

3. **App hides the entire Invoices section from managers even though the server allows viewing (and even generating) invoices.**
   `mgr1`'s real permissions include both `invoice.view` and `invoice.generate`, and `GET /houses/{h}/invoices` returns 200 for `mgr1`. The Invoices nav button on House Detail is gated on `canProvider('invoice.generate')` ([house_detail_screen.dart:146,225](lib/features/houses/presentation/house_detail_screen.dart#L146)) rather than `invoice.view`. The app's own `managerPermissions` set only contains `invoice.view`, not `invoice.generate`, so the gate evaluates `false` and managers get no entry point to Invoices at all — even read-only. (The Invoices screen itself correctly gates the Generate action separately on `invoice.generate` at [invoices_screen.dart:84](lib/features/invoices/presentation/invoices_screen.dart#L84); the bug is only in the House Detail nav button choosing the wrong permission to decide visibility of the section.)

4. **The server's real permission model is never consumed by the app.**
   `GET /auth/me` returns a `permissions: [...]` array using server-side names (`meterReading.record`, `renter.assignRoom`, `renter.transfer`, `manager.create`, `manager.view`, `due.createManual`, `audit.view`, `room.updateFinancial`, ...). The app's `User` model ([user_model.dart](lib/core/auth/user_model.dart)) has no `permissions` field at all — the array is dropped on the floor — and `canProvider` ([current_user_provider.dart:16-56](lib/core/auth/current_user_provider.dart#L16-L56)) instead hardcodes its own permission strings per role, which use a different naming scheme than the server (`assignment.manage` vs. server's `renter.assignRoom`/`renter.transfer`; `meterReading.manage` vs. `meterReading.record`; `manager.manage`/`manager.assign` vs. `manager.create`/`manager.assign`/`manager.revoke`/`manager.view`). This works today only because gating is self-consistent within the app, but it means the app's permission model can silently drift from the server's real authorization rules (as it already has for #2 and #3) with no compile-time or runtime signal.

## Per-feature results (A–M)

| # | Feature | Result | Evidence |
|---|---|---|---|
| A | Auth | PASS | `owner1` login → 200 + `access_token`/`refresh_token`/`user`; wrong password → 401 `INVALID_CREDENTIALS`; `GET /auth/me` → 200 with `user` + `permissions`; `mgr1` login → 200. |
| B | Houses | PASS | `GET /houses` as `owner1` → `["Mir Monjil"]`. As `mgr1` → same single house (the only one they're assigned to), matching expectation. |
| C | Rooms & renters | PASS | 5 rooms, 9 renters returned for Mir Monjil; every field in `room.dart`/`renter.dart` present and non-null where `required` (nullable fields like `floor`, `meter_number`, `nid_number` etc. were null but correctly typed as nullable in the models — no crash risk). |
| D | Bill configs | PASS | 3 active configs returned; all fields match `bill_config.dart` exactly. |
| E | Meter readings | PASS | Room G102 (metered) → 1 reading; all fields match `meter_reading.dart` exactly. |
| F | Managers | PASS | `GET /managers` → 1 manager (mgr1); `GET /houses/{h}/managers` → 1 assignment, **includes nested `manager` object** as `manager.dart`'s `HouseManagerAssignment.manager` expects. |
| G | Expenses | PASS | `?year=2026&month=7` → 4 expenses; all fields match `expense.dart` exactly. |
| H | Dues | PASS | `GET` dues for renter "saidi" → 5 dues covering PAID, PARTIAL, WAIVED statuses; `metadata` returned as an object (`{"created_manually":true}`), matching the `Map<String,dynamic>?` type. Permitted write cycle: created due (head=CUSTOM, amount="1") → status `OPEN` → waived with reason "QA test cleanup" → status `WAIVED` + `waive_reason` set correctly → re-waive attempt → 422 `DUE_NOT_WAIVABLE` as expected. |
| I | Invoices | PASS | `GET /houses/{h}/invoices?year=2026&month=7` → exactly 2 invoices; list-response keys are an **exact match** to `invoice.dart`'s `Invoice` model (no `renter_name`/`room_number`/`outstanding`, confirming the model's own code comment). Detail fetch → includes `line_items` (keys: `id,head,label,amount,metadata`), matching `LineItem`. `POST .../invoices/generate {"year":2026,"month":7}` → `already_generated:true`, invoice count unchanged (2) after the call — no duplicate creation. |
| J | Reports | PASS | `pnl` (2026/7) → now shows billed rent (`billed.total="8801.00"`, `rent="8000.00"`) since invoices exist for the period; `occupancy` → `{total_rooms:5, occupied:3, vacant:2, occupancy_rate:"60.00"}`; `dues-aging` → digit-keyed buckets `0_30/31_60/61_90/90_plus` present and matching `DuesBuckets`' `@JsonKey` mappings exactly. |
| K | Collection preview | PASS | `GET /houses/{h}/renters/{r}/collection-preview` for a renter with a July invoice → `current_invoice` present with `line_items` and an `outstanding` field; shape matches `CollectionPreview`/`PreviewInvoice` (see field-mismatch table below for extra ignored fields). |
| L | Permissions (mgr1) | PASS (with findings) | `GET /managers` → 403 (raw exception body, see Critical #1); `GET /houses/{h}/managers` → 403 (same); `GET /houses/{h}/bill-configs` → 403 (same); `GET /houses/{h}/reports/pnl` → **200 allowed** (app hides this, Critical #2); `GET /houses/{h}/expenses` → 200 allowed (app shows this, consistent); `GET /houses/{h}/renters` → 200 allowed (consistent); `GET /houses/{h}/invoices` → **200 allowed** (app hides this, Critical #3). |
| M | Static app audit | PASS (with notes) | All feature routes present in `app_router.dart`, including the new (uncommitted) `invoices` + `invoices/:invoiceId` nesting under `/houses/:id`. Write screens invalidate the expected providers (`dues`, `meter_readings`, `expenses`, `managers`, `house_managers`, `rooms`, `renters`, `invoices` — the invoice-generate flow correctly invalidates `invoicesProvider`, `previewProvider`, and `duesProvider` as a family-wide invalidation since generation can affect many renters at once). `flutter analyze`: 0 errors in `lib/`, 7 info-level lint suggestions (null-aware-elements style, 1 deprecated `drift/web.dart` import), 1 pre-existing error in `test/widget_test.dart` (references nonexistent `MyApp` — stale default template test, unrelated to app features). No `TODO`/`FIXME` markers found in `lib/`. |

Skipped (per data-safety rules): renter/room/house/bill-config/manager/meter-reading/expense **write** tests on Mir Monjil (create/edit/delete) — read-only only, as instructed. `POST .../collect` — never called, as instructed.

## Model-vs-API field mismatches (table)

| Feature | Field | Issue |
|---|---|---|
| Invoices (list) | *(none)* | Exact match — no missing or extra fields. |
| Invoices (detail) | *(none)* | Exact match including `line_items`. |
| Collection preview | `current_invoice.house_id`, `.room_id`, `.renter_id`, `.base_rent`, `.electricity_amount`, `.issued_at`, `.created_at` | **Present but unmapped**: the server's `current_invoice` in the preview response includes full invoice fields beyond what `PreviewInvoice` declares. Not a crash risk (json_serializable ignores unknown keys), but these fields are silently discarded — if the UI ever needs e.g. `issued_at` on the preview screen, it isn't available without widening the model. |
| Rooms / Renters / BillConfigs / MeterReadings / Managers / Expenses / Dues / Reports | *(none)* | All exact matches against their respective models. |

## Things only a human can test

- Login screen UX: error message rendering for `INVALID_CREDENTIALS`, loading states, "must reset password" redirect flow.
- Token refresh-on-401 behavior under real network conditions (single-flight refresh, concurrent-request queueing) — this audit only exercised fresh logins, not expiry/refresh races.
- Offline cache-then-network behavior (drift cache population, offline banner, outbox flush on reconnect) — needs airplane-mode testing on a device/emulator.
- Manager's actual in-app experience: confirm the missing Reports/Invoices nav entries (Critical #2, #3) are indeed invisible in the running app, not just in the permission provider.
- Money formatting/rounding display (`money.dart` / `money_text.dart`) for the string amounts observed (e.g. "8801.00", "-159699.00" negative net figures) — visual check for negative-number styling.
- Collection flow's `OVERPAYMENT_NOT_ALLOWED` and other collect-time error surfacing (not exercised — `collect` is destructive and excluded from this audit).
- Push notification registration (`POST /devices`) — not implemented/tested.
- Pull-to-refresh and pagination UX on list screens with more data than one page (all lists tested here fit on a single page, `per_page:20`).
- Deep-link / back-stack behavior for the nested go_router routes (e.g. landing directly on `/houses/{id}/invoices/{invoiceId}` without the list screen having loaded).

## Cleanup performed

One QA due was created on renter "saidi" (head=CUSTOM, head_label="QA TEST - ignore", amount="1.00") and immediately waived with reason "QA test cleanup", per the audit's data-safety rules. No other writes were made to Mir Monjil.
