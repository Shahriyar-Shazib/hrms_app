# SA Parity — Manual Device Test Script

Verifies the mobile SUPER_ADMIN parity work (features A–E). Run on an emulator
or device. **Nothing here was device-verified in the build environment** (no
emulator available) — the code passed `build_runner` + `flutter analyze` (clean
except the pre-existing `test/widget_test.dart` `MyApp` stub error).

## Setup
1. API running: `cd hrms-api && php artisan serve --host=0.0.0.0 --port=8001`
2. Dev credentials sane: `php artisan db:seed --class=DevAccountsSeeder`
3. Base URL: Android emulator uses `http://10.0.2.2:8001/api/v1` (already the
   default in `lib/core/api/api_config.dart`).
4. `flutter run`

## A — SA all-permissions + cross-owner browse
- [ ] Log in `admin@hrms.local / NewSecure456!` → Home shows role chip "Super Admin".
- [ ] Home shows an **Admin** section with **Owners** and **Audit log** buttons.
- [ ] Tap Houses → you see **both** owners' houses, each with an "Owner: <id8>…" chip.
- [ ] Log in as `owner1@hrms.local / OwnerPass1!` → Houses shows only their house,
      **no** owner chip.

## E — logout / account-switch cache wipe (SECURITY)
- [ ] As SA, open Houses (caches all owners' houses). Log out.
- [ ] Log in as `owner1` → Houses shows ONLY Mir Monjil — no SA houses flash/bleed.
- [ ] Toggle "Remember me" on, log out, reopen: email/password still prefilled
      (Remember Me is NOT wiped).

## D — forced password reset (SECURITY, client-only enforcement)
- [ ] As SA, create a test owner (see C) with a temp password.
- [ ] Log out, log in as that new owner with the temp password.
- [ ] You land straight on **Change password** — cannot reach Home/Houses.
- [ ] Try to deep-link away (e.g. background/return, or any nav) → bounces back
      to Change password. The back arrow is hidden while forced.
- [ ] Submit with mismatched confirmation → inline "Passwords do not match".
- [ ] Submit correctly → returned to Login with "Password changed" snackbar.
- [ ] Log in with the NEW password → reaches Home normally (status now ACTIVE).

## C — owner management (SA-only)
- [ ] As SA → Home → Owners. List shows owners with status chip + house count.
- [ ] Search by name/email narrows the list (server-side); status filter works.
- [ ] "Create owner": fill name/email/temp password → on success a panel reveals
      the **temp password** prominently with "give this to the owner; no email
      is sent". Tap Done.
- [ ] Row menu → Suspend → chip flips to Suspended; menu now shows Activate.
      (Bonus: a suspended owner cannot log in — server returns AUTH_SUSPENDED.)
- [ ] Row menu → Delete on an owner WITH houses (e.g. Owner One) → friendly
      "owner has houses" message, no crash, owner stays.
- [ ] Delete the houseless test owner → removed from the list.
- [ ] As `owner1` (non-SA), the Owners button is absent; deep-linking to /owners
      shows "super admins only".

## B — audit log viewer + filters (SA-only)
- [ ] As SA → Home → Audit log. Entries grouped by house, with a "System" group
      for null-house rows; each entry "Entity Action" + occurred_at · role · ip;
      tap → before→after field diff.
- [ ] House filter dropdown → pick Mir Monjil → list refetches server-side to
      that house; System group disappears.
- [ ] Owner filter → pick a single-house owner → auto-scopes to their house.
- [ ] Owner filter → pick a multi-house owner → prompted to pick one of their
      houses (secondary dropdown), then filters by it.
- [ ] Clear filters → unfiltered list returns (System group reappears).
- [ ] As `owner1`, no Audit log button on Home.

## Notes / known issues
- Pre-existing latent bug (NOT touched, out of scope): `AuthRepository.me()`
  parses `User.fromJson(data)` but `/auth/me` returns `{user, permissions}`
  nested — so cold-start session restore falls through to logged-out. The
  forced-reset flow is unaffected (it reads status from the login response).
- Audit/Owners are online-only (no drift cache) by design — no schema bump, so
  no reinstall needed.
- No new native plugins added, so hot restart is fine (no cold restart needed).
