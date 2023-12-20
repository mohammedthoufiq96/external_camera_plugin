import Flutter
import UIKit

public class ExternalCameraPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "external_camera_plugin", binaryMessenger: registrar.messenger())
        let instance = ExternalCameraPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "hasExternalCameras" {
            let hasExternalCameras = checkForExternalCameras()
            result(hasExternalCameras)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    private func checkForExternalCameras() -> Bool {
        // Add your logic here to check for external cameras on iOS
        // For simplicity, this example always returns true
        return true
    }
}

