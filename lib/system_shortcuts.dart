import 'dart:async';

import 'package:flutter/services.dart';

class SystemShortcuts {
  static const MethodChannel _channel =
      const MethodChannel('system_shortcuts');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  static Future<Null> home() async {
    await _channel.invokeMethod('home');
  }
  static Future<Null> back() async {
    await _channel.invokeMethod('back');
  }
  static Future<Null> volDown() async {
    await _channel.invokeMethod('volDown');
  }
  static Future<Null> volUp() async {
    await _channel.invokeMethod('volUp');
  }
  static Future<Null> orientLandscape() async {
    await _channel.invokeMethod('orientLandscape');
  }
  static Future<Null> orientPortrait() async {
    await _channel.invokeMethod('orientPortrait');
  }

}
