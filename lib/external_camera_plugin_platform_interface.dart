import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'external_camera_plugin_method_channel.dart';

abstract class ExternalCameraPluginPlatform extends PlatformInterface {
  /// Constructs a ExternalCameraPluginPlatform.
  ExternalCameraPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ExternalCameraPluginPlatform _instance = MethodChannelExternalCameraPlugin();

  /// The default instance of [ExternalCameraPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelExternalCameraPlugin].
  static ExternalCameraPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ExternalCameraPluginPlatform] when
  /// they register themselves.
  static set instance(ExternalCameraPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
