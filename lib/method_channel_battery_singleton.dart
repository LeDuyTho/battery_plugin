import 'dart:async';

import 'battery_state.dart';
import 'method_channel_battery.dart';

/// The interface that implementations of battery must implement.
abstract class MethodChannelBatterySingleton {
  static MethodChannelBatterySingleton _instance = MethodChannelBattery();

  static MethodChannelBatterySingleton get instance => _instance;

  /// Gets the battery level from device.
  Future<int> batteryLevel() {
    throw UnimplementedError('batteryLevel() has not been implemented.');
  }

  /// gets battery state from device.
  Stream<BatteryState> onBatteryStateChanged() {
    throw UnimplementedError(
        'onBatteryStateChanged() has not been implemented.');
  }
}
