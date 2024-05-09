# flutter_template

## Getting Started

## Generate scripts

```bash
dart run build_runner build --delete-conflicting-outputs
```

Generate l10n files
```bash
dart run intl_utils:generate
```

## Flavor Flutter run script

```bash
flutter run --flavor dev
flutter run --flavor prod --dart-define=ENV='prod'
```

## Import sorter script

```bash
dart run import_sorter:main --no-comments
```
