import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:system_shortcuts/system_shortcuts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
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
            ],
          )
        ),
      ),
    );
  }
}
