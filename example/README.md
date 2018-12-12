```
FlatButton(
    child: Text("Home"),
    onPressed: () async {
    await SystemShortcuts.home();
    },
),
FlatButton(
    child: Text("Back"),
    onPressed: () async {
    await SystemShortcuts.back();
    },
),
FlatButton(
    child: Text("VolDown"),
    onPressed: () async {
    await SystemShortcuts.volDown();
    },
),
FlatButton(
    child: Text("VolUp"),
    onPressed: () async {
    await SystemShortcuts.volUp();
    },
),
FlatButton(
    child: Text("Landscape"),
    onPressed: () async {
    await SystemShortcuts.orientLandscape();
    },
),
FlatButton(
    child: Text("Portrait"),
    onPressed: () async {
    await SystemShortcuts.orientPortrait();
    },
),
FlatButton(
    child: Text("Wifi"),
    onPressed: () async {
    await SystemShortcuts.wifi();
    },
),
FlatButton(
    child: Text("Check Wifi"),
    onPressed: () async {
    print(await SystemShortcuts.checkWifi);
    },
),
FlatButton(
    child: Text("Bluetooth"),
    onPressed: () async {
    await SystemShortcuts.bluetooth();
    },
),
FlatButton(
    child: Text("Check Bluetooth"),
    onPressed: () async {
    print(await SystemShortcuts.checkBluetooth);
    },
),

```