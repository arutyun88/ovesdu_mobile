# ovesdu_mobile

OvesDu Mobile App

# TODO

### Get name if it exist

- [x] implement the name lookup use case when authorizing on TDD
- [ ] implement the name lookup repository when authorizing on TDD
- [ ] implement the name lookup datasource on the server when authorizing on TDD
- [ ] implement UI

## Getting Started

flutter gen-l10n --template-arb-file=app_en.arb --output-localization-file=app_localizations.dart
--output-class=AppLocalizations

generating: flutter packages pub run build_runner build --delete-conflicting-outputs

Environments:
env:
dev - приложение обращается к dev-серверу (локальная машина). prod - приложение обращается к
prod-серверу (основной сервер на удаленной машине). test - моковые репозитории без обращения к сети.

AppTextField:
происходит расфокусировка при открытии клавиатуры