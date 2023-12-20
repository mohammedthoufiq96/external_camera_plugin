
import 'external_camera_plugin_platform_interface.dart';

class ExternalCameraPlugin {
  Future<String?> getPlatformVersion() {
    return ExternalCameraPluginPlatform.instance.getPlatformVersion();
  }
}
