# system_shortcuts

A flutter plugin to use system shortcuts.

Thanks to **[Rody Davis](https://github.com/rodydavis)** for IOS implementation.

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
### Make this import 

> import 'package:system_shortcuts/SystemShortcutsFlutter.dart';

# Functions 

### Press home button using this function.

> await SystemShortcuts.home();// perform a home button tap in android

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

### All Contibutors :

**[Rody Davis](https://github.com/rodydavis)** - IOS Implementation

**[Thorben Markmann](https://github.com/tmarkmann)** - Plugin V2 embedding, Updation lib dependencies.
