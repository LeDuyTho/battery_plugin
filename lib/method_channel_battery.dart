import 'package:flutter/services.dart';
import 'dart:async';
import 'method_channel_battery_singleton.dart';
import 'battery_state.dart';

/// An implementation of [BatteryPlatform] that uses method channels.
class MethodChannelBattery extends MethodChannelBatterySingleton {
  /// The method channel used to interact with the native platform.
  final MethodChannel channel = MethodChannel('plugins.flutter.io/battery');

  /// The event channel used to interact with the native platform.
  final EventChannel eventChannel = EventChannel('plugins.flutter.io/charging');

  /// Method channel for getting battery level.
  Future<int> batteryLevel() async {
    return (await channel.invokeMethod('getBatteryLevel')).toInt();
  }

  /// Stream variable for storing battery state.
  Stream<BatteryState> _onBatteryStateChanged;

  /// Event channel for getting battery change state.
  Stream<BatteryState> onBatteryStateChanged() {
    if (_onBatteryStateChanged == null) {
      _onBatteryStateChanged = eventChannel
          .receiveBroadcastStream()
          .map((dynamic event) => parseBatteryState(event));
    }

    return _onBatteryStateChanged;
  }
}
