import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'external_camera_plugin_platform_interface.dart';

/// An implementation of [ExternalCameraPluginPlatform] that uses method channels.
class MethodChannelExternalCameraPlugin extends ExternalCameraPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('external_camera_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
