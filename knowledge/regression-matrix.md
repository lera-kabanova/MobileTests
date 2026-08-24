# Regression Coverage Matrix

Status legend: **TODO** (placeholder only) · **IN PROGRESS** · **STABLE** · **BLOCKED** (has an unresolved dependency, see Notes).

| ID | Regression test (original) | Module | File | Status | Existing/New | Notes |
|----|------------------------------|--------|------|--------|---------------|-------|
| 1 | Корректное отображение формы "Регистрация" | Auth / Registration | `flows/auth/registration_form_display.yaml` | TODO | New | UI-only |
| 2 | Регистрация пользователя через email | Auth / Registration | `flows/auth/registration_email.yaml` | TODO | New | Needs fresh/unused email per run |
| 3 | Регистрация пользователя с существующим email | Auth / Registration | `flows/auth/registration_existing_email.yaml` | TODO | New | Needs one guaranteed pre-existing email |
| 4 | Регистрация пользователя через Google account | Auth / Registration | `flows/auth/registration_google_account.yaml` | TODO | New | Requires real/test Google account |
| 5 | OTP | Auth / OTP | `flows/auth/otp_verification.yaml` | TODO | New | Vague scope — may need SMS/code retrieval; may split later (see report) |
| 6 | Ссылки на пользовательские соглашения | Auth / Agreements | `flows/auth/agreements_links.yaml` | TODO | New | UI-only, external links/WebView |
| 7 | Вход через email с правильным логином и правильным паролем | Auth / Login | `flows/auth/login_valid_credentials.yaml` | TODO | New | Calls `subflows/auth/login.yaml`; that subflow is itself still a WIP stub (see Reusable subflows table) |
| 8 | Вход с правильным логином и неправильным паролем | Auth / Login | `flows/auth/login_invalid_password.yaml` | TODO | New | Negative case |
| 9 | Вход с незарегистрированным логином и любым паролем | Auth / Login | `flows/auth/login_unregistered_user.yaml` | TODO | New | Negative case |
| 10 | Вход пользователя через Google account | Auth / Login | `flows/auth/login_google_account.yaml` | TODO | New | Requires real/test Google account |
| 11 | Восстановление пароля | Auth / Password Recovery | `flows/auth/password_recovery.yaml` | TODO | New | Needs email/SMS access |
| 12a | Функциональность кнопки "Уведомления" (новый дизайн) | Home | `flows/home/notifications_button_functionality.yaml` | TODO | New | Split from source item 12 |
| 12b | "Уведомления" — пустой грид | Home | `flows/home/notifications_empty_state.yaml` | TODO | New | Split from source item 12; needs zero-notification account |
| 13 | Функциональность кнопки "Отсканируйте QR код" | Home | `flows/home/qr_scan_button.yaml` | TODO | New | May need camera permission handling |
| 14 | Геолокация на карте | Home | `flows/home/map_geolocation.yaml` | TODO | New | Needs location mocking |
| 15 | Корректное отображение списка станций | Stations | `flows/stations/station_list_display.yaml` | TODO | New | Needs seeded station data |
| 16 | Недоступные станции в конце списка | Stations | `flows/stations/station_list_unavailable_order.yaml` | TODO | New | Needs mixed available/unavailable stations |
| 17 | "Избранные станции" в фильтре на карте и в списке | Stations | `flows/stations/stations_filter_favorites.yaml` | TODO | New | Covers map+list in one file; overlaps with #31 |
| 18 | "Свободно" в фильтре на карте и в списке | Stations | `flows/stations/stations_filter_available.yaml` | TODO | New | Covers map+list in one file |
| 19 | Функциональность кнопки "Проложить маршрут" | Stations | `flows/stations/stations_route_button.yaml` | TODO | New | External maps intent; overlaps with #32, #46 |
| 20 | Функциональность кнопки "Профиль" | Profile | `flows/profile/profile_button_navigation.yaml` | TODO | New | Requires being logged in |
| 21 | Корректное отображение формы "История заправок" | Profile | `flows/profile/charging_history_display.yaml` | TODO | New | Needs account with history records |
| 22 | "История заправок" — пустой грид | Profile | `flows/profile/charging_history_empty_state.yaml` | TODO | New | Needs account with zero history |
| 23 | Корректное отображение формы "Платежная информация" | Profile | `flows/profile/payment_information_display.yaml` | TODO | New | UI-only |
| 24 | Привязать карту | Profile | `flows/profile/add_card.yaml` | IN PROGRESS | **Existing** | Real steps present but ends mid-flow (`inputText: "asd asd"` after tapping "Привязать карту"); no assertions yet |
| 25 | Корректное отображение формы "Язык" | Profile | `flows/profile/language_settings_display.yaml` | TODO | New | UI-only |
| 26 | Корректное отображение формы "О приложении" | Profile | `flows/profile/about_app_display.yaml` | TODO | New | UI-only |
| 27 | Пополнить баланс, если карта привязана | Profile | `flows/profile/top_up_balance_with_card.yaml` | TODO | New | Depends on #24 (card linked) |
| 28 | Сменить фото | Profile | `flows/profile/change_profile_photo.yaml` | TODO | New | May need gallery/camera permission |
| 29 | Изменить пароль | Profile | `flows/profile/change_password.yaml` | TODO | New | Mutates credentials — use disposable account |
| 30 | Функциональность кнопки "Удалить аккаунт" | Profile | `flows/profile/delete_account.yaml` | TODO | New | Destructive/irreversible — disposable account only |
| 31 | Избранные станции (charging context) | Charging | `flows/charging/charging_favorite_station.yaml` | TODO | New | Overlaps with #17 — clarify if distinct screen/feature |
| 32 | Проложить маршрут (charging context) | Charging | `flows/charging/charging_route_button.yaml` | TODO | New | Overlaps with #19, #46 |
| 33 | Плашка "Идет зарядка" — % без дробной части, kW ≤1 знак после запятой | Charging | `flows/charging/charging_widget_value_formatting.yaml` | TODO | New | Needs active charging session |
| 34 | Отображать по умолчанию предыдущий способ оплаты | Charging | `flows/charging/charging_default_payment_method.yaml` | TODO | New | Needs account with a prior payment |
| 35 | Полный бак с карты. После завершения зарядки получаем SMS | Charging | `flows/charging/charging_full_tank_card_sms_notification.yaml` | TODO | New | **Not** the same as existing `02_full_tank_card.yaml` (see report — that file stops manually, never waits for SMS) |
| 36 | Полный бак с баланса. Ручная остановка | Charging | `flows/charging/01_full_tank_balance.yaml` | STABLE | **Existing** | Full working scenario |
| 37 | 80% с карты. Ручная остановка | Charging | `flows/charging/04_80_percent_card.yaml` | STABLE | **Existing** | Full working scenario |
| 38 | 80% с баланса. Ручная остановка | Charging | `flows/charging/03_80_percent_balance.yaml` | BLOCKED | **Existing** | Assertion for "My balance" payment method removed — corporate test account lacks that payment method; needs correct test account |
| 39 | График | Charging | `flows/charging/charging_graph_display.yaml` | TODO | New | Needs active/completed session with graph data |
| 40 | PDF чек | Charging | `flows/charging/charging_pdf_receipt.yaml` | TODO | New | Needs completed session; may need file/download verification |
| 41 | Бронирование — станция #57 Минск, ул. Ваупшасова 84 — CCS2, начать зарядку в течение времени | Booking | `flows/booking/booking_reserve_specific_connector.yaml` | TODO | New | Hardcoded station data; timing-sensitive |
| 42 | Возможность бронирования при балансе > 0 хотя бы на одном счету | Booking | `flows/booking/booking_availability_condition_balance.yaml` | TODO | New | Needs controlled balance/card state |
| 43 | Окончание бронирования — исчезновение плашки и статус коннектора | Booking | `flows/booking/booking_expiration_widget_and_status.yaml` | TODO | New | Timing-dependent, real or backend-controlled clock |
| 44 | Отмена бронирования — подтверждение и отмена | Booking | `flows/booking/booking_cancel_confirm.yaml` | TODO | New | Needs existing booking as precondition |
| 45 | Отмена бронирования — сохранить бронь | Booking | `flows/booking/booking_cancel_keep_reservation.yaml` | TODO | New | Needs existing booking as precondition |
| 46 | Бронирование — функциональность кнопки "Проложить маршрут" | Booking | `flows/booking/booking_route_button.yaml` | TODO | New | Overlaps with #19, #32 |
| 47 | Повторное бронирование доступно после выполнения зарядки | Booking | `flows/booking/booking_rebook_after_charging.yaml` | TODO | New | Sequential dependency on a completed charging flow |
| 48 | 1 польз. заряжается, 2 в очереди — продвижение очереди + рестарт/переподключение за 20с | Queue | `flows/queue/queue_progression_and_reconnect.yaml` | TODO | New | Needs 3 concurrent accounts/devices, tight 20s timing |
| 49 | 1 польз. бронирует затем заряжается, 2 в очереди — продвижение очереди | Queue | `flows/queue/queue_progression_with_booking.yaml` | TODO | New | Same multi-device constraint as #48 |
| 50 | Зарядка водителем с корпо-аккаунта — 1 kWh | Corporate | `flows/corporate/corporate_charging_1kwh.yaml` | TODO | New | Needs dedicated corporate test account, precise kWh stop condition |

## Reusable subflows

| Subflow | Location | Used by | Status |
|---|---|---|---|
| `swipe_to_start_charging_mode.yaml` | `flows/charging/` | 01, 02, 03, 04 | Existing |
| `swipe_payment_to_start.yaml` | `flows/charging/` | 01, 02, 03, 04 | Existing |
| `swipe_charging_mode_forward.yaml` | `flows/charging/` | 03, 04 | Existing |
| `swipe_payment_forward.yaml` | `flows/charging/` | 02, 04 | Existing |
| `login.yaml` | `subflows/auth/` | intended for every test needing an authenticated session (item 7 now, virtually all of home/stations/profile/charging/booking/queue/corporate later) | WIP — only `launchApp: {clearState: true}` + one coordinate tap; needs email/password input steps and a success assertion before other flows can safely call it |

No other reusable subflows exist yet. New ones (logout, open profile, select station, select connector, add card, cancel booking, etc.) should only be extracted once a second real caller exists — see `regression-structure.md`.
