import 'dart:async';

import 'method_channel_battery_singleton.dart';
import 'battery_state.dart';

/// API for accessing information about the battery of the device the Flutter
/// app is currently running on.
class Battery {
  /// Returns the current battery level in percent.
  Future<int> get batteryLevel async =>
      await MethodChannelBatterySingleton.instance.batteryLevel();

  /// Fires whenever the battery state changes.
  Stream<BatteryState> get onBatteryStateChanged =>
      MethodChannelBatterySingleton.instance.onBatteryStateChanged();
}
