import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

/// You can use shortcuts like pressing home and back button programatically
/// by calling home ( ) and back ( ) functions respectively.
///
/// You can also control volume keys by calling volUp ( ) and volDown ( )
/// to press volume Up button and volume Down button respectively.
///
/// You can change the orientation of your app by calling functions
/// orientLandscape ( ) or orientPortrait ( ) to turn the app into
/// landscape and portrait mode respectively.
///
/// You can toggle wifi and bluetooth as well using wifi ( ) and bluetooth ( )
/// functions respectively
class SystemShortcuts {
  static const MethodChannel _channel = const MethodChannel('system_shortcuts');

  /// Press home button programatically .
  ///
  /// Implemetation :-
  ///
  /// await SystemShortcuts.home ( );
  static Future<Null> home() async {
    await _channel.invokeMethod('home');
  }

  /// Press back button programatically .
  ///
  /// Implemetation :-
  ///
  /// await SystemShortcuts.back ( );
  static Future<Null> back() async {
    await _channel.invokeMethod('back');
  }

  /// Press Volume Down button programatically .
  ///
  /// Implemetation :-
  ///
  /// await SystemShortcuts.volDown ( );
  static Future<Null> volDown() async {
    await _channel.invokeMethod('volDown');
  }

  /// Press Volume Up button programatically .
  ///
  /// Implemetation :-
  ///
  /// await SystemShortcuts.volUp ( );
  static Future<Null> volUp() async {
    await _channel.invokeMethod('volUp');
  }

  /// Change app orientation to landscape mode
  ///
  /// Implemetation :-
  ///
  /// await SystemShortcuts.orientLandscape ( );
  static Future<Null> orientLandscape() async {
    await _channel.invokeMethod('orientLandscape');
  }

  /// Change app orientation to Portrait mode
  ///
  /// Implemetation :-
  ///
  /// await SystemShortcuts.orientPortrait ( );
  static Future<Null> orientPortrait() async {
    await _channel.invokeMethod('orientPortrait');
  }

  /// Toggle Wifi.
  ///
  /// If it is already turned on wifi ( ) will turn it off
  /// else it'll turn it on
  static Future<Null> wifi() async {
    if (Platform.isIOS) {
    } else {
      await _channel.invokeMethod('wifi');
    }
  }

  /// Return true if the wifi is alreay turned on.
  ///
  /// Return false if the wifi is turned off.
  static Future<bool?> get checkWifi async {
    bool? b = await _channel.invokeMethod('checkWifi');
    return b;
  }

  /// Toggle bluetooth.
  ///
  /// If it is already turned on bluetooth ( ) will turn it off
  /// else it'll turn it on
  static Future<Null> bluetooth() async {
    if (Platform.isIOS) {
    } else {
      await _channel.invokeMethod('bluetooth');
    }
  }

  /// Return true if the bluetooth is alreay turned on.
  ///
  /// Return false if the bluetooth is turned off.
  static Future<bool?> get checkBluetooth async {
    bool? b = await _channel.invokeMethod('checkBluetooth');
    return b;
  }
}
