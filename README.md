# news_app

This is an API based flutter project titled  "News App" created by Rushikesh Kumbhar using News.org API.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Platform  Firebase App Id
web       1:46116205504:web:367368bdaa48ba04a0ce25
android   1:46116205504:android:743cea515aa80049a0ce25
ios       1:46116205504:ios:1eff5dd843e9c139a0ce25

App Id for OneSignal: 5890f301-9211-4f41-ac84-fb164c055384
OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);



// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
print("Accepted permission: $accepted");
});