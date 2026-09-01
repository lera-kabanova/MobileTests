# Тест-план автотестов (Maestro)

Чек-лист всех запланированных и реализованных автотестов проекта, в порядке логической разработки — от авторизации к более сложным сценариям.

Статусы:
- ✅ Готов — сценарий реализован, содержит реальные шаги и явные проверки (assert)
- 🔄 В процессе — есть реальные шаги, но сценарий не доведён до конца (нет финальной проверки)
- ⚠️ Заблокирован — сценарий реализован, но не может быть завершён из-за внешней причины (см. примечание)
- ⏳ В планах — файл создан как заглушка (`launchApp` без шагов), реализация впереди

| №  | Файл                                            | Название теста / Сценарий                                        | Статус        | Путь                                                           | Модуль    |
|----|-------------------------------------------------|------------------------------------------------------------------|---------------|----------------------------------------------------------------|-----------|
| 1  | `login.yaml`                                    | Авторизация пользователя (переиспользуемый subflow)              | ✅ Готов       | `subflows/auth/login.yaml`                                     | Auth      |
| 2  | `login_valid_credentials.yaml`                  | Вход через email с правильным логином и паролем                  | ✅ Готов       | `flows/auth/login_valid_credentials.yaml`                      | Auth      |
| 3  | `login_invalid_password.yaml`                   | Вход с правильным логином и неправильным паролем                 | ✅ Готов       | `flows/auth/login_invalid_password.yaml`                       | Auth      |
| 4  | `login_unregistered_user.yaml`                  | Вход с незарегистрированным логином                              | ✅ Готов       | `flows/auth/login_unregistered_user.yaml`                      | Auth      |
| 5  | `login_google_account_cached.yaml`              | Вход через Google — аккаунт уже подсказан (one-tap)              | 🔄 В процессе | `flows/auth/login_google_account_cached.yaml`                  | Auth      |
| 5b | `login_google_account_manual.yaml`              | Вход через Google — полный ручной флоу                           | 🔄 В процессе | `flows/auth/login_google_account_manual.yaml`                  | Auth      |
| 6  | `registration_form_display.yaml`                | Отображение формы "Регистрация"                                  | ✅ Готов       | `flows/auth/registration_form_display.yaml`                    | Auth      |
| 7  | `registration_email.yaml`                       | Регистрация через email                                          | ✅ Готов       | `flows/auth/registration_email.yaml`                           | Auth      |
| 8  | `registration_existing_email.yaml`              | Регистрация с уже существующим email                             | ✅ Готов       | `flows/auth/registration_existing_email.yaml`                  | Auth      |
| 9  | `registration_google_account.yaml`              | Регистрация через Google account                                 | ⏳ В планах    | `flows/auth/registration_google_account.yaml`                  | Auth      |
| 10 | `password_recovery.yaml`                        | Восстановление пароля                                            | ✅ Готов       | `flows/auth/password_recovery.yaml`                            | Auth      |
| 11 | `agreements_links.yaml`                         | Ссылки на пользовательские соглашения                            | ✅ Готов       | `flows/auth/agreements_links.yaml`                             | Auth      |
| 12 | `notifications_button_functionality.yaml`       | Функциональность кнопки "Уведомления"                            | ✅ Готов       | `flows/home/notifications_button_functionality.yaml`           | Home      |
| 13 | `notifications_empty_state.yaml`                | "Уведомления" — пустой грид                                      | ⏳ В планах    | `flows/home/notifications_empty_state.yaml`                    | Home      |
| 14 | `qr_scan_button.yaml`                           | Функциональность кнопки "Отсканируйте QR код"                    | 🔄 В процессе | `flows/home/qr_scan_button.yaml`                               | Home      |
| 15 | `map_geolocation.yaml`                          | Геолокация на карте                                              | ⏳ В планах    | `flows/home/map_geolocation.yaml`                              | Home      |
| 16 | `station_list_unavailable_order.yaml`           | Список станций: отображение + недоступные в конце (объединено)   | 🔄 В процессе | `flows/stations/station_list_unavailable_order.yaml`           | Stations  |
| 18 | `stations_filter_favorites.yaml`                | Фильтр "Избранные станции" (карта + список)                      | 🔄 В процессе | `flows/stations/stations_filter_favorites.yaml`                | Stations  |
| 19 | `stations_filter_available.yaml`                | Фильтр "Свободно" (карта + список)                               | 🔄 В процессе | `flows/stations/stations_filter_available.yaml`                | Stations  |
| 20 | `stations_route_button.yaml`                    | Функциональность кнопки "Проложить маршрут" с карты              | Не Готов      | `flows/stations/stations_route_button.yaml`                    | Stations  |
| 21 | `profile_button_navigation.yaml`                | Функциональность кнопки "Профиль"                                | ✅ Готов       | `flows/profile/profile_button_navigation.yaml`                 | Profile   |
| 22 | `payment_information_display.yaml`              | Отображение формы "Платежная информация"                         | ✅ Готов       | `flows/profile/payment_information_display.yaml`               | Profile   |
| 23 | `add_card.yaml`                                 | Привязка банковской карты                                        | ✅ Готов       | `flows/profile/add_card.yaml`                                  | Profile   |
| 24 | `top_up_balance_with_card.yaml`                 | Пополнить баланс, если карта привязана                           | ✅ Готов       | `flows/profile/top_up_balance_with_card.yaml`                  | Profile   |
| 25 | `charging_history_display.yaml`                 | Отображение формы "История заправок"                             | ✅ Готов       | `flows/profile/charging_history_display.yaml`                  | Profile   |
| 26 | `charging_history_empty_state.yaml`             | "История заправок" — пустой грид                                 | 🔄 В процессе | `flows/profile/charging_history_empty_state.yaml`              | Profile   |
| 27 | `language_settings_display.yaml`                | Отображение формы "Язык"                                         | 🔄 В процессе | `flows/profile/language_settings_display.yaml`                 | Profile   |
| 28 | `about_app_display.yaml`                        | Отображение формы "О приложении"                                 | ✅ Готов       | `flows/profile/about_app_display.yaml`                         | Profile   |
| 29 | `change_profile_photo.yaml`                     | Смена фото профиля                                               | 🔄 В процессе | `flows/profile/change_profile_photo.yaml`                      | Profile   |
| 30 | `change_password.yaml`                          | Изменение пароля                                                 | ✅ Готов       | `flows/profile/change_password.yaml`                           | Profile   |
| 31 | `delete_account.yaml`                           | Удаление аккаунта                                                | 🔄 В процессе | `flows/profile/delete_account.yaml`                            | Profile   |
| 32 | `01_full_tank_balance.yaml`                     | 01. Полный бак с баланса (ручная остановка)                      | ✅ Готов       | `flows/charging/01_full_tank_balance.yaml`                     | Charging  |
| 33 | `02_full_tank_card.yaml`                        | 02. Полный бак с карты (ручная остановка)                        | ✅ Готов       | `flows/charging/02_full_tank_card.yaml`                        | Charging  |
| 34 | `03_80_percent_balance.yaml`                    | 03. Зарядка до 80% с баланса                                     | ✅ Готов       | `flows/charging/03_80_percent_balance.yaml`                    | Charging  |
| 35 | `04_80_percent_card.yaml`                       | 04. Зарядка до 80% с карты                                       | ✅ Готов       | `flows/charging/04_80_percent_card.yaml`                       | Charging  |
| 36 | `charging_default_payment_method.yaml`          | Отображение по умолчанию предыдущего способа оплаты              | ✅ Готов       | `flows/charging/charging_default_payment_method.yaml`          | Charging  |
| 37 | `charging_widget_value_formatting.yaml`         | Плашка "Идет зарядка" — форматирование % и кВт                   | ✅ Готов       | `flows/charging/charging_widget_value_formatting.yaml`         | Charging  |
| 38 | `charging_favorite_station.yaml`                | Избранные станции (в контексте зарядки)                          | ⏳ В планах    | `flows/charging/charging_favorite_station.yaml`                | Charging  |
| 39 | `charging_route_button.yaml`                    | Функциональность кнопки "Проложить маршрут" со станции           | ✅ Готов       | `flows/charging/charging_route_button.yaml`                    | Charging  |
| 40 | `charging_full_tank_card_sms_notification.yaml` | Полный бак с карты — SMS-уведомление после завершения            | ⚠️ Заблокирован | `flows/charging/charging_full_tank_card_sms_notification.yaml` | Charging  |
| 41 | `charging_graph_display.yaml`                   | Отображение графика зарядки                                      | ⚠️ Заблокирован | `flows/charging/charging_graph_display.yaml`                   | Charging  |
| 42 | `charging_pdf_receipt.yaml`                     | PDF-чек                                                          | ✅ Готов       | `flows/charging/charging_pdf_receipt.yaml`                     | Charging  |
| 43 | `booking_reserve_specific_connector.yaml`       | Бронирование конкретного коннектора                              | ✅ Готов       | `flows/booking/booking_reserve_specific_connector.yaml`        | Booking   |
| 44 | `booking_availability_condition_balance.yaml`   | Возможность бронирования при балансе > 0                         | ✅ Готов       | `flows/booking/booking_availability_condition_balance.yaml`    | Booking   |
| 45 | `booking_expiration_widget_and_status.yaml`     | Окончание бронирования — исчезновение плашки и статус коннектора | ✅ Готов       | `flows/booking/booking_expiration_widget_and_status.yaml`      | Booking   |
| 46 | `booking_route_button.yaml`                     | Функциональность кнопки "Проложить маршрут" (бронирование)       | ✅ Готов       | `flows/booking/booking_route_button.yaml`                      | Booking   |
| 47 | `queue_progression_and_reconnect.yaml`          | Продвижение очереди                                              | 🔄 В процессе | `flows/queue/queue_progression_and_reconnect.yaml`             | Queue     |
| 48 | `queue_progression_with_booking.yaml`           | Продвижение очереди с предварительным бронированием              | 🔄 В процессе | `flows/queue/queue_progression_with_booking.yaml`              | Queue     |
| 49 | `corporate_charging_1kwh.yaml`                  | Зарядка водителем с корпоративного аккаунта — 1 kWh              | 🔄 В процессе | `flows/corporate/corporate_charging_1kwh.yaml`                 | Corporate |
