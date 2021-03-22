# Flutter ATM

Test task ATM on the Flutter.

## Getting Started
### Step 1
Go to project root and execute the following command in console to get the required dependencies:
```dart
flutter pub get packages
```
### Step 2
This project uses inject library that works with code generation, execute the following command to generate files:
```dart
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

## Languages, libraries and tools used
### Libraries
* [Flutter BLoC](https://pub.dev/packages/flutter_bloc)
* [Freezed](https://pub.dev/packages/freezed) for unions/pattern-matching/copy
* Annotations for Freezed with [Freezed Annotation](https://pub.dev/packages/freezed_annotation)
* Dependency Injection with [Get It](https://pub.dev/packages/get_it)
* [Injectable](https://pub.dev/packages/injectable) for DI
* Animations with [Simple Animations](https://pub.dev/packages/simple_animations)

### Generators
* [Injectable Generator](https://pub.dev/packages/injectable_generator)

## Architecture
This project follows Google architecture guidelines that are based on BLoC.

## Project structure
- core
- features
    - atm
      - data
        - models
        - providers
        - repositories
      - domain
        - providers
        - repositories
      - presentation
        - bloc
        - pages
        - widgets
        
## Overview
Entered Correct Amount (iOS)|Entered Incorrect Amount (iOS)|Entered Large Amount (iOS)
:------------------------:|:--------------------------:|:-------------------------:
![alt-ios-correct-screen](https://github.com/Holofox/flutter_atm/blob/master/screenshots/ios/entered_correct_amount_screen.png "Entered Correct Amount")|![alt-ios-incorrect-screen](https://github.com/Holofox/flutter_atm/blob/master/screenshots/ios/entered_incorrect_amount_screen.png "Entered Incorrect Amount")|![alt-ios-large-amount-screen](https://github.com/Holofox/flutter_atm/blob/master/screenshots/ios/entered_large_amount_screen.png "Entered Large Amount")
Start Screen (Android) | Entered Сorrect Amount (Android) | Entered Incorrect Amount (Android)
|![alt-android-start-screen](https://github.com/Holofox/flutter_atm/blob/master/screenshots/android/start_screen.png "Start screen")|![alt-android-correct-screen](https://github.com/Holofox/flutter_atm/blob/master/screenshots/android/entered_correct_amount_screen.png "Entered Correct Amount")|![alt-android-incorrect-screen](https://github.com/Holofox/flutter_atm/blob/master/screenshots/android/entered_incorrect_amount_screen.png "Entered Incorrect Amount")

## References
* [Flutter](https://flutter.dev/)
* [Effective Dart](https://dart.dev/guides/language/effective-dart)

## License

This source is released under the [MIT License](https://github.com/Holofox/flutter_atm/blob/master/LICENSE).