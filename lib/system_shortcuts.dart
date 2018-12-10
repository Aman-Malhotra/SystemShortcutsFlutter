
import 'package:flutter/services.dart';

class SystemShortcuts {
  static const MethodChannel _channel = const MethodChannel('system_shortcuts');

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

  static Future<Null> wifi() async {
    await _channel.invokeMethod('wifi');
  }

  static Future<bool> checkWifi() async {
    bool b = await _channel.invokeMethod('checkWifi');
    return b;
  }

  static Future<Null> bluetooth() async {
    await _channel.invokeMethod('bluetooth');
  }

  static Future<bool> checkBluetooth() async {
    bool b = await _channel.invokeMethod('checkBluetooth');
    return b;
  }


  static Future<bool> checkAirplaneMode() async {
    bool b = await _channel.invokeMethod('checkAirplaneMode');
    return b;
  }
}
