# HRMS Flutter App — Build Plan

A mobile app (Flutter) for the House Rental Management System (HRMS) REST API.
Serves all three roles: Super Admin, House Owner, Manager. Offline-first.

---

## 1. Decisions (locked)

- **Roles:** All three (Super Admin, Owner, Manager) in one app, UI gated by role + permissions.
- **State management:** **Riverpod** (`flutter_riverpod` + `riverpod_generator`). Chosen over Bloc (less boilerplate for ~15 CRUD resources) and Provider (Riverpod is its compile-safe successor).
- **Offline:** Offline-first for **reads** and **non-financial writes**. Money-mutating actions (collect payment, waive due, generate invoice) are **online-first / server-authoritative** — queued offline only as "pending sync," never confirmed locally (the server allocates payments, rejects overpayments, and locks rows; the app must not assume success).

---

## 2. API facts the app must match

- Base URL (dev): `http://127.0.0.1:8001/api/v1`
  - Android emulator → `http://10.0.2.2:8001/api/v1`
  - iOS simulator → `http://127.0.0.1:8001/api/v1`
  - Physical device → `http://<machine-LAN-IP>:8001/api/v1` (run API with `--host=0.0.0.0`)
- **Auth:** JWT (Laravel Passport). `POST /auth/login` returns `access_token` (60 min), `refresh_token` (30 days), `must_reset_password`, `user{}`. Refresh via `POST /auth/refresh` (rotates — revokes old tokens). `POST /auth/logout`. `GET /auth/me` for current user + role.
- **Success envelope:** `{ "data": ..., "meta": ... }`
- **Error envelope:** `{ "error": { "code": "STRING_CODE", "message": "...", "details": [...] } }`
  - Codes the UI should handle: `VALIDATION_FAILED`, `UNAUTHENTICATED`, `FORBIDDEN`, `NOT_FOUND`, `OVERPAYMENT_NOT_ALLOWED`, `MANAGER_ALREADY_ASSIGNED`, `MANAGER_OWNER_MISMATCH`, `DUE_NOT_WAIVABLE`, `ROOM_HAS_NO_METER`, `READING_ALREADY_EXISTS`, etc.
- **Money:** server uses BCMath, returns money as **strings** (e.g. `"8500.00"`). The app must treat money as strings/Decimal — **never parse to double** for arithmetic. Use the `decimal` package or keep as string for display.
- **Multi-tenancy:** server scopes data by role automatically; the app just calls endpoints. A revoked manager gets 404 on houses they no longer manage.

### Test users
- `admin@hrms.local` / `NewSecure456!` (SUPER_ADMIN)
- `owner1@hrms.local` / `OwnerPass1!` (HOUSE_OWNER)
- `mgr1@hrms.local` / `MgrPass1!` (MANAGER)

### Endpoint map (what screens will call)
- Auth: `POST /auth/login|refresh|logout`, `GET /auth/me`, `POST /auth/password`
- Houses: `GET|POST /houses`, `GET|PUT|DELETE /houses/{h}`
- Rooms: `…/houses/{h}/rooms` (CRUD)
- Bill configs: `…/houses/{h}/bill-configs` (CRUD + `/current`)
- Renters: `…/houses/{h}/renters` (CRUD)
- Assignments: `POST …/renters/{r}/assign|transfer|move-out`, `GET …/renters/{r}/assignments`
- Uploads: `POST /uploads`
- Meter readings: `…/houses/{h}/rooms/{room}/meter-readings` (+ `/adjust`)
- Invoices: `POST …/houses/{h}/invoices/generate`, `GET …/invoices`, `GET …/invoices/{id}`
- Collection: `GET …/renters/{r}/collection-preview`, `POST …/renters/{r}/collect`
- Dues: `POST|GET …/renters/{r}/dues`, `POST …/dues/{d}/waive`
- Expenses: `…/houses/{h}/expenses` (CRUD)
- Reports: `GET …/houses/{h}/reports/pnl|occupancy|dues-aging`, `GET …/renters/{r}/ledger`
- Managers: `POST|GET /managers`, `GET /managers/{m}`, `…/houses/{h}/managers` (assign/update/revoke/list)
- Devices: `POST|GET /devices`, `DELETE /devices/{id}`
- Audit: `GET /audit-logs`

---

## 3. Package stack

```
flutter_riverpod, riverpod_annotation        # state
dio                                           # http + interceptors (auth, refresh, logging)
go_router                                     # routing + role guards
flutter_secure_storage                        # JWT storage (Keychain/Keystore)
freezed_annotation, json_annotation           # immutable models + json
drift, sqlite3_flutter_libs, path_provider, path   # offline SQLite cache + outbox
decimal                                       # money (NEVER use double for money)
connectivity_plus                             # detect online/offline for sync
firebase_messaging (later)                    # push -> POST /devices

dev: build_runner, riverpod_generator, freezed, json_serializable, drift_dev
```

---

## 4. Folder structure

```
lib/
  main.dart
  core/
    api/
      dio_client.dart          # Dio + base URL + interceptors
      auth_interceptor.dart    # attach access token; on 401 refresh once, retry
      api_envelope.dart        # parse {data,meta} / {error}; throw ApiException(code,message,details)
      api_exception.dart
    auth/
      auth_repository.dart      # login/refresh/logout/me
      token_storage.dart        # secure storage read/write
      auth_controller.dart      # Riverpod AsyncNotifier: authState (loggedOut/loggingIn/loggedIn)
      current_user_provider.dart# user + role + permissions; helpers like can('due.waive')
    db/
      database.dart             # drift db; tables: cached_houses, cached_renters, ..., outbox
      outbox.dart               # queued offline writes
    sync/
      sync_service.dart         # on reconnect: flush outbox, refetch
    router/
      app_router.dart           # go_router; redirect by auth + role
    money.dart                  # Decimal helpers, formatting (string-safe)
    theme.dart
  features/
    <feature>/                  # houses, rooms, renters, assignments, invoices,
      data/                     #   collection, dues, expenses, reports, managers,
        <feature>_repository.dart  #   meter_readings, devices, audit
        models/ *.dart (freezed)
      application/
        <feature>_controller.dart  (Riverpod notifiers)
      presentation/
        <feature>_list_screen.dart, <feature>_detail_screen.dart, widgets/
  shared/
    widgets/ (loading, error, empty states, money_text.dart)
    extensions/
```

---

## 5. Offline-first design

**Reads (cache-then-network):**
1. Screen reads from drift → instant display (even offline).
2. Repository fetches API in background → upserts into drift.
3. Riverpod watches the drift query (stream) → UI auto-updates when fresh data lands.
4. Offline → show cached data + an "offline" banner.

**Writes — two classes:**

- **Non-financial (create renter, draft meter reading, update profile):** optimistic — write to drift + enqueue in `outbox`; flush when online. Safe because no server-side allocation logic.

- **Financial (collect payment, waive due, generate invoice, assign/transfer/move-out with money implications):** **online-first.** If offline, allow the user to queue it but mark **"pending — not confirmed."** On sync, send to server; the server is authoritative (it may reject: overpayment, balance changed, due already settled). Only mark "confirmed" after a 2xx. Show clearly that pending ≠ done.

**Outbox table:** `id, method, path, body(json), created_at, status(pending/sent/failed), response_code, error`. Flush in FIFO order; stop on auth failure (re-login needed).

---

## 6. Build order (do these in sequence)

1. **Skeleton + Dio + auth interceptor + token storage.** Login screen → store JWT → authenticated Dio that auto-refreshes on 401. Land on a placeholder home. *Goal: log in as owner1 and print `/auth/me`.*
2. **Current user + permissions provider.** Expose role + permissions; build a `can(permission)` helper to gate UI.
3. **Role-based routing (go_router).** Redirect: SA→admin home, Owner→houses overview, Manager→assigned-houses collection view. Logged-out→login.
4. **First vertical slice: Houses (read).** API→drift→Riverpod→UI, including offline cache. Proves the whole stack before scaling. *Don't build all 15 features until this one is clean.*
5. **Collection flow (the app's core value).** `collection-preview` + `collect`, online-first, with the money-string handling and overpayment error surfaced nicely.
6. **Remaining features** (renters, rooms, invoices, dues, expenses, reports, managers, meter readings).
7. **Outbox + sync engine.** Wire offline writes + reconnect flush.
8. **Push notifications.** Firebase → register token via `POST /devices`.

---

## 7. First Claude Code session prompt (scaffold the project)

Paste this into Claude Code, run from the `hrms_app/` Flutter project root, AFTER `flutter create` and `flutter pub add` (Steps 1–2 above):

```
We are building a Flutter app for an existing HRMS REST API. This is the first 
build session. The project was created with `flutter create` and these packages 
are already added: flutter_riverpod, riverpod_annotation, dio, go_router, 
flutter_secure_storage, freezed_annotation, json_annotation, drift, 
sqlite3_flutter_libs, path_provider, path, decimal, connectivity_plus; 
dev: build_runner, riverpod_generator, freezed, json_serializable, drift_dev.

API facts:
- Base URL dev: Android emulator http://10.0.2.2:8001/api/v1 ; iOS sim 
  http://127.0.0.1:8001/api/v1. Put base URL in a single config constant so it's 
  easy to switch.
- Auth: POST /auth/login {email,password} -> {data:{access_token, refresh_token, 
  access_expires_at, refresh_expires_at, must_reset_password, user:{id,email,
  full_name,role,status}}}. role is one of SUPER_ADMIN, HOUSE_OWNER, MANAGER.
- POST /auth/refresh {refresh_token} -> new token pair (rotates; old tokens 
  revoked). POST /auth/logout. GET /auth/me -> current user.
- Success envelope: {data, meta}. Error envelope: {error:{code,message,details}}.
- Money is returned as strings ("8500.00") — never parse to double; keep as 
  string / Decimal.

TASK FOR THIS SESSION — build ONLY the auth foundation and prove it works:
1. core/api/api_config.dart — base URL constant (default Android emulator URL).
2. core/api/api_exception.dart — ApiException with code, message, details, httpStatus.
3. core/api/api_envelope.dart — helpers to unwrap {data} and to throw ApiException 
   from {error}.
4. core/auth/token_storage.dart — flutter_secure_storage wrapper: save/read/clear 
   access + refresh tokens.
5. core/api/dio_client.dart — a configured Dio (baseUrl, JSON headers) provided 
   via Riverpod.
6. core/api/auth_interceptor.dart — attaches Bearer access token; on 401, calls 
   /auth/refresh ONCE using the stored refresh token, saves the new pair, retries 
   the original request; if refresh fails, clears tokens and signals logout.
7. core/auth/auth_repository.dart — login(), logout(), me(), refresh().
8. core/auth/auth_controller.dart — Riverpod AsyncNotifier exposing auth state 
   (unknown/loggedOut/loggedIn) + the current user; checks stored token on startup.
9. core/auth/current_user_provider.dart — exposes user, role, and a can(permission) 
   helper (fetch permissions from /auth/me if present, else derive from role).
10. core/router/app_router.dart — go_router with: /login, /home (placeholder per 
    role). Redirect unauthenticated -> /login; authenticated on /login -> /home.
11. A simple LoginScreen (email+password, calls auth_controller.login) and a 
    HomeScreen that shows the logged-in user's name + role + a logout button.
12. Wire main.dart with ProviderScope + the router.

Use freezed for the User model and json_serializable. Run build_runner. 
Then tell me exactly how to test it (which command, which emulator URL note), 
and STOP. Do not build any other features yet — auth foundation only.

Important: handle the money-as-string rule and the {data}/{error} envelopes 
correctly from the start, since every future feature depends on these.
```

---

## 8. After auth works — next prompts (one feature at a time)

Keep using the same pattern that worked for the API build: **one vertical slice per Claude Code session, review before moving on.** Suggested order of follow-up prompts:

1. "Build the Houses feature: drift table + repository (cache-then-network) + 
   Riverpod controller + list & detail screens. Read-only first."
2. "Add the current-user permission gating to the UI (hide actions the role 
   can't do)."
3. "Build the Collection flow: collection-preview screen + collect action 
   (online-first). Surface OVERPAYMENT_NOT_ALLOWED and other error codes nicely."
4. ... then renters, invoices, dues, expenses, reports, managers, meter readings.
5. "Build the offline outbox + sync service."
6. "Add Firebase push and register the token via POST /devices."

---

## 9. Gotchas to remember

- **Emulator networking:** `127.0.0.1` inside Android emulator = the emulator. Use `10.0.2.2` for host. Physical device needs LAN IP + API on `--host=0.0.0.0`.
- **Money = strings.** The API returns `"8500.00"`. Never `double.parse` for math. Use `Decimal.parse` or keep as string.
- **Token refresh races:** ensure the interceptor refreshes only ONCE per 401 and queues concurrent requests, or you'll fire multiple refreshes (which rotate/revoke each other since the API revokes old tokens on refresh).
- **Pending ≠ confirmed for money.** Never tell the user a payment succeeded until the server returns 2xx — the server can reject it.
- **Role gating is UI-only convenience.** The server already enforces permissions; the app just hides what the user can't do for a cleaner UX. Don't rely on the app for security.
- **must_reset_password:** if true after login, route the user to a change-password screen before the home.
