# Regression Structure

How the Maestro regression project is organized, what already exists, and where to put new tests.

See `regression-matrix.md` in this same folder for the full 50-item coverage table.

## App under test

- `appId: by.batteryfly.ev_charging.dev` — used by every flow file.
- No `config.yaml` / `.maestro/config.yaml` exists yet — there are no global env vars, tags, or CI wiring configured. Not created as part of this pass (out of scope).

## Functional modules (`flows/`)

```
flows/
  auth/         Registration, login, password recovery, OTP, agreements
  home/         Home screen: notifications, QR scan, map geolocation
  stations/     Station list, filters (favorites/available), route button
  profile/      Profile screen and its sub-forms (history, payments, settings)
  charging/     Charging session flows + the swipe subflows they share
  booking/      Reservation lifecycle
  queue/        Multi-user queue behavior
  corporate/    Corporate-account-specific flows

subflows/
  auth/         Reusable auth steps (currently: login)
```

`auth`, `profile`, and `charging` already existed before this pass and use a **flat** layout (all scenario files sit directly in the module folder, no further nesting). New modules follow the same flat convention for consistency — one YAML file per independent test scenario, named after the business scenario, in English, no dates, no arbitrary numbering.

`home` and `stations` were split out of the source list's single "Home / Stations" section because it covered two distinct concerns (home-screen widgets vs. the station map/list), and 8 items is enough to justify separate folders.

Charging-history (items 21–22) stayed under `profile/` rather than becoming its own top-level module, because the source list places them under the "Profile" header (reached via the profile screen) — kept faithful to the original grouping rather than the initial folder sketch.

## What's already implemented vs. placeholder

Every file already in the repo before this pass was left untouched — nothing was rewritten, renamed, or deleted.

**Existing, real scenarios:**
- `flows/charging/01_full_tank_balance.yaml` — item 36, STABLE
- `flows/charging/04_80_percent_card.yaml` — item 37, STABLE
- `flows/charging/03_80_percent_balance.yaml` — item 38, BLOCKED (see matrix — payment-method assertion removed pending correct test account)
- `flows/charging/02_full_tank_card.yaml` — a manual-stop, card-paid full-tank scenario. **Does not correspond 1:1 to item 35** ("full tank with card, ends via SMS after auto-completion") — it stops manually and never waits for an SMS. Left as-is; item 35 got its own new placeholder file instead of overwriting this one. Needs a decision from you on whether `02_full_tank_card.yaml` should stay as an extra (uncatalogued) scenario or be renamed/reclassified.
- `flows/profile/add_card.yaml` — item 24, IN PROGRESS. Has real steps (fills card number, expiry, CVC, taps "Привязать карту") but the flow keeps going after that into what looks like an unrelated/unfinished capture (`inputText: "asd asd"`) with no assertion that the card was actually added.
- `subflows/auth/login.yaml` — confirmed by you to be the reusable login subflow (not a standalone test). Relocated from `flows/auth/login.yaml` to `subflows/auth/login.yaml` for that reason. Still just `launchApp: {clearState: true}` + one coordinate tap — needs email/password input steps and a success assertion added before other flows can safely `runFlow` it. Item 7 now has its own placeholder, `flows/auth/login_valid_credentials.yaml`, which will call this subflow once both are implemented.

**Reusable subflows (existing, already shared by multiple tests):**
- `flows/charging/swipe_to_start_charging_mode.yaml`
- `flows/charging/swipe_payment_to_start.yaml`
- `flows/charging/swipe_charging_mode_forward.yaml`
- `flows/charging/swipe_payment_forward.yaml`

These stay exactly where they are. They're referenced from sibling files via bare filenames (`runFlow: { file: swipe_...yaml }`), which resolves relative to the calling flow's folder — moving them into a separate `subflows/` folder would break every existing `runFlow` reference, so don't do that.

**Everything else** (46 files) is a new placeholder: `appId` header, a comment block naming the ID/scenario/notes, and a single `- launchApp` so the file is syntactically valid but not implemented. Status TODO in the matrix. No selectors, no test data, no assertions — that's the next phase, module by module.

## `subflows/`

```
subflows/
  auth/
    login.yaml    Reusable login step (WIP — see above). Called via runFlow from
                  flows/auth/login_valid_credentials.yaml and, eventually, from any
                  flow in home/, stations/, profile/, charging/, booking/, queue/,
                  corporate/ that needs an authenticated starting state.
```

This is the first (and currently only) subflow extracted outside `flows/charging/`, created because you confirmed `login.yaml` was meant as reusable rather than a standalone test. Everything else still follows the project's rule of not building an abstraction before it's proven reusable — the following are likely future candidates, but stay as inline steps inside their first real test until a second caller actually needs them:

- logout
- open profile
- select station / select connector
- stop charging
- open payment information
- cancel booking

Create `subflows/<area>/<name>.yaml` only once a second real test needs the same steps.

Note on `runFlow` paths: `subflows/auth/login.yaml` sits in a different top-level folder than the tests that will call it, so those `runFlow` references must use a path relative to the calling flow (e.g. `../../subflows/auth/login.yaml` from `flows/auth/login_valid_credentials.yaml`), unlike the charging swipe subflows which are called by bare filename because they live alongside their callers.

## Where to add new tests going forward

- A new independent regression scenario → one new file in the matching `flows/<module>/` folder, named after the business scenario (e.g. `flows/booking/booking_cancel_confirm.yaml`).
- A step reused by 2+ scenarios → extract to `subflows/<module>/<step>.yaml` at that point, not before.
- Update `regression-matrix.md` status (TODO → IN PROGRESS → STABLE, or BLOCKED with a reason) whenever a placeholder gets implemented.

## Known duplication / overlap to resolve before implementing

"Проложить маршрут" (route button) appears three times against what looks like the same UI control in different contexts: item 19 (stations list/map), item 32 (charging screen), item 46 (booking screen). Kept as three separate files since they may exercise the feature from three different entry screens, but confirm with the app whether one shared subflow (e.g. `subflows/navigation/open_route.yaml`) makes sense once you look at the actual screens.

Similarly, "Избранные станции" appears as item 17 (stations filter) and item 31 (charging context) — same question.
