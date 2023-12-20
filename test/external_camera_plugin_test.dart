import 'package:flutter_test/flutter_test.dart';
import 'package:external_camera_plugin/external_camera_plugin.dart';
import 'package:external_camera_plugin/external_camera_plugin_platform_interface.dart';
import 'package:external_camera_plugin/external_camera_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockExternalCameraPluginPlatform
    with MockPlatformInterfaceMixin
    implements ExternalCameraPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ExternalCameraPluginPlatform initialPlatform = ExternalCameraPluginPlatform.instance;

  test('$MethodChannelExternalCameraPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelExternalCameraPlugin>());
  });

  test('getPlatformVersion', () async {
    ExternalCameraPlugin externalCameraPlugin = ExternalCameraPlugin();
    MockExternalCameraPluginPlatform fakePlatform = MockExternalCameraPluginPlatform();
    ExternalCameraPluginPlatform.instance = fakePlatform;

    expect(await externalCameraPlugin.getPlatformVersion(), '42');
  });
}
