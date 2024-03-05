# system_shortcuts

> A flutter plugin to use system shortcuts

Thanks to **[Rody Davis](https://github.com/rodydavis)** for IOS implementation.

### For using functions and getters related to WIFI settings 

You need to add these two permissions in your `AndroidManifest.xml` file:

```xml
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"></uses-permission>
<uses-permission android:name="android.permission.CHANGE_WIFI_STATE"></uses-permission>
```

### For using functions and getters related to BLUETOOTH settings

You need to add these two permissions in your `AndroidManifest.xml` file:

```xml
<uses-permission android:name="android.permission.BLUETOOTH"/>
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
```

### Make this import 

```dart
import 'package:system_shortcuts/SystemShortcutsFlutter.dart';
```

# Functions 

### Press home button using this function.

```dart
// Perform a home button tap in android
await SystemShortcuts.home();
```

### Press back button using this function

```dart
// Perform a back button tap in android
await SystemShortcuts.back();
```

### Press volume Down in using this function

```dart
// Perform a volume down button click
await SystemShortcuts.volDown();
```

### Press volume Down in using this function

```dart
// Perform a volume up button click
await SystemShortcuts.volUp();
```

### Toggle WIFI using this function

```dart
// Toggle wifi in android
await SystemShortcuts.wifi();
```

### Toggle BLUETOOTH using this function

```dart
// Toggle bluetooth in android
await SystemShortcuts.bluetooth();
```

# Getters

### Get current WIFI state

```dart
await SystemShortcuts.checkWifi; // bool
```

### Get current BLUETOOTH state

```dart
await SystemShortcuts.checkBluetooth; // bool
``````

# Usage

```dart
FlatButton(
  child: Text("Home"),
  onPressed: () async {
    await SystemShortcuts.home();
  },
),
FlatButton(
  child: Text("Check Wifi"),
  onPressed: () async {
    bool wifi = await SystemShortcuts.checkWifi;
  },
),
```

### All Contibutors :

**[Rody Davis](https://github.com/rodydavis)** - IOS Implementation

**[Thorben Markmann](https://github.com/tmarkmann)** - Plugin V2 embedding, Updation lib dependencies.
