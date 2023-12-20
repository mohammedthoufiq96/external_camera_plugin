import Flutter
import UIKit
import AVFoundation

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
             let devices = AVCaptureDevice.devices(for: .video)

        for device in devices {
            if device.position == .external {
                return true
            }
        return false
    }
}

