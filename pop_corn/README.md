# Popcorn

A new Flutter project.

## Prerequisite
This application use TheMovieDB api, please go to [this website](https://developer.themoviedb.org/docs/getting-started) and get the api token.
Once receive the api token please update the API token in `pop_corn/lib/data/services/service_config.dart`
```dart
abstract final class ServiceConfig {
  static const apiToken = ''; // update the api token here
}
```

## Getting Started
AndroidManifest
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Run the project
Make sure you run emulator on your device

### development environment
This environment going to get the data from `/assets/*.json` files, not require network connection will contains only sample data
```bash 
$ cd popcorn
$ flutter run --target lib/main_development.dart
```

### staging environment
This environment going to get the data from `themoviedb` api, require network connection
```bash 
$ cd popcorn
$ flutter run --target lib/main_staging.dart
```

## Test the Project
### Golden test capture new images
```bash 
$ cd popcorn
$ flutter test --update-goldens
```
### Unit test (including golden test)
```bash 
$ cd popcorn
$ flutter test
```

### Integration Tests

Integration tests must be run from the `popcorn` directory.
**Make sure you run emulator on your device**

**Integration tests with local data**

```bash
cd popcorn
$ flutter test integration_test
```


## Development Aspect
### Format Code
```bash
$ cd popcorn
$ dart format lib
```
### Analyze code
```bash
$ cd popcorn
$ flutter analyze
```

### Run build runner to create mock/json
```bash
$ cd popcorn
$ dart run build_runner build
```
