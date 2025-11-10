# Popcorn
![](https://github.com/theerasan/Movie-Flutter/blob/main/pop_corn/git_splash.png)
### Description:
A Flutter showcase project that demonstrates building a modern, responsive movie application. The app displays a list of movies, allows users to view detailed information for each movie, and supports adding movies to a favorites list.

### Key Features:
- 🎬 **Movie List & Details:** Browse movies and view detailed information (e.g., title, poster, overview, rating).
- ⭐ **Favorites:** Add or remove movies from a personalized favorites list.
- 🔍 **Search:** Search movies by title with real-time filtering.
- ♾️ **Infinite Scrolling:** Automatically load more movies as the user scrolls.
- 🌗 **Light & Dark Mode:** Seamless support for both light and dark themes.
- 🔄 **Orientation Support:** Fully responsive in both portrait and landscape modes.
- ⚠️ **Error Handling:** Graceful error states with retry options (e.g., network or API errors).

### Localization (l10n):
- 🇺🇸 **English (en-US):** Default language for displaying the app in English (United States).
- 🇹🇭 **Thai (th):** Fully localized interface for displaying the app in Thai.
---
## Prerequisite
This application uses **The Movie Database (TMDb) API**.
To get started, visit the [TMDb Developer Portal](https://developer.themoviedb.org/docs/getting-started) and obtain an `API token`.
Once you have your token, update the API_TOKEN value in:.
```bash
pop_corn/lib/data/services/service_config.dart
```
```dart
abstract final class ServiceConfig {
  static const apiToken = ''; // update the api token here
}
```
---

## Run the project
Ensure that an emulator or physical device is running before launching the app.

### development environment
This environment retrieves data from the `/assets/*.json` files and does not require a network connection. It contains only sample data for demonstration purposes.
```bash 
$ cd popcorn
$ flutter run --target lib/main_development.dart
```

### staging environment
This environment retrieves data from the **The Movie Database (TMDb)** API and requires a network connection.
```bash 
$ cd popcorn
$ flutter run --target lib/main_staging.dart
```
---
## Test the Project
### Golden test
Golden tests in Flutter help ensure visual consistency by comparing the rendered UI against reference images, known as golden images.

#### Capture New Golden Images
```bash 
$ cd popcorn
$ flutter test --update-goldens
```
### Unit test
This test also runs a **golden test** to verify the widget’s appearance against the reference _golden image_.
```bash 
$ cd popcorn
$ flutter test
```

### Integration Tests
Ensure that an emulator or physical device is running before executing the integration tests.
The integration tests use the **development environment** and do not require a network connection, as they rely on local sample data.

```bash
cd popcorn
$ flutter test integration_test
```
---

## Development Tools & Commands
The project includes a set of development commands and tools to improve the developer experience

### Format Code
Code formatting to automatically format Dart/Flutter code.
```bash
$ cd popcorn
$ dart format lib
```
### Analyze code
Code analyze to enforce consistent coding style
```bash
$ cd popcorn
$ flutter analyze
```

### Run build runner
Other utility scripts to simplify common development workflows.
- Create JSON phraser objects
- Create mock classes for unit test
```bash
$ cd popcorn
$ dart run build_runner build
```

### Update l10n
Generate/update the l10n files.
```bash
$ cd popcorn
$  flutter gen-l10n
```
