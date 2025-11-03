# Popcorn

A new Flutter project.

## Getting Started

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
$ flutter run --target lib/main_statging.dart
```

