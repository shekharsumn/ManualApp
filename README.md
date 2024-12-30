# manual_app

Manual App: A Flutter Project

## Setup the flutter enviornment before getting started
link: https://docs.flutter.dev/get-started/install

### Task
Case Study Project - Mobile Engineer  

Here is the video of the app:
<iframe src="https://player.vimeo.com/video/1042840972" width="640" height="360" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>

Specifications ::
figma: https://www.figma.com/design/h2AUeekHTf1T82Jlbvad6T/Mobile-Design?node-id=0-1&t=lcj3t2QLq8u1M90j-1 

### Considerations & Approach

1. Design Pattern Used M-V-VM with Riverpod. Riverpod offers an improved version of Provider with better scalability and performance.Supports dependency injection and encourages a more modular approach to state management.
2. AutoRoute library for app navigations.
3. API Calls/Data Handling in this app is done using API Service Layer that encapsulate all HTTP requests and responses within this layer to abstract away networking details from the rest of the app. Model Classes uses `json_serializable` to automatically generate model classes from JSON. Currrently All data are being read from jasomData/app_json_data.dart class
4. Unit Tests can be found for all widgets under test folder.
5. App can be run using VSCode or Xcode or Android Studio.
6. Entry point to the app is main.dart under lib folder
7. Steps to run this app -> start ios or android emulator/connect actual device -> flutter run
8. Incase of troubleshooting -> flutter clean -> flutter pub get -> dart run build_runner build

Additional code like encryption manager, secure storage class are essential for app security as apps might need to save user related information. Hence we as developers need to ensure that proper safe guards are in place to protect it.







