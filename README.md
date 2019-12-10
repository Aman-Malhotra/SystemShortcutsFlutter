# system_shortcuts

A flutter plugin to use system shortcuts.No IOS Implementation yet . Pull Request for ios implementation are welcome.

### For using funtions and getters related to WIFI settings you need to add these two permissions in your AndroidManifext.xml file
```
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"></uses-permission>
<uses-permission android:name="android.permission.CHANGE_WIFI_STATE"></uses-permission>
```

### For using funtions and getters related to BLUETOOTH settings you need to add these two permissions in your AndroidManifext.xml file
```
<uses-permission android:name="android.permission.BLUETOOTH"/>
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
```

# Functions 

### Press home button using this function.

> await SystemShortcuts.home();// go to default laucher from any app 

### Press back button using this function

> await SystemShortcuts.back();// perform a back button tap in android

### Press volume Down in using this function

> await SystemShortcuts.volDown();// perform a volume down button click

### Press volume Down in using this function

> await SystemShortcuts.volUp();// perform a volume up button click

### Toggle WIFI using this function

> await SystemShortcuts.wifi();// toggle wifi in android 

### Toggle BLUETOOTH using this function

> await SystemShortcuts.bluetooth();// toggle bluetooth in android 

# Getters

### Get current WIFI state

> await SystemShortcuts.checkWifi;// return true/false

### Get current BLUETOOTH state

> await SystemShortcuts.checkBluetooth;// return true/false

# Usage
```
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
## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.io/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
