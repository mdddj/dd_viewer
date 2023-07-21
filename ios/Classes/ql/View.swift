//
//  View.swift
//  dd_viewer
//
//  Created by ldd on 2023/6/27.
//

import Flutter
import QuickLook
import SwiftUI

class QlPreView: NSObject, FlutterPlatformView {
    var flutterMethedChannel: FlutterMethodChannel
    var flutterRegistrar: FlutterPluginRegistrar
    var viewId: Int64

    let qlController = QLViewController()

    init(flutterRegistrar: FlutterPluginRegistrar, documentURL: URL? = nil, viewId: Int64) {
        self.flutterRegistrar = flutterRegistrar
        self.viewId = viewId
        self.flutterMethedChannel = FlutterMethodChannel(name: "dd_view_\(String(viewId))", binaryMessenger: flutterRegistrar.messenger())
        super.init()
        self.flutterMethedChannel.setMethodCallHandler(methodHandle)
    }

    func methodHandle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "present":
            qlController.presentToView()
            result(true)
            break
        case "set-url":
            if let filePath: String = (call.arguments as! Dictionary<String, Any>)["path"] as? String {
                print("Ql Preview接收URL\(filePath)")
                qlController.changeUrl(docUrl: URL(fileURLWithPath: filePath))
                result(true)
            }
            result(false)
            break
        default:
            result(FlutterMethodNotImplemented)
            break
        }
    }

    func view() -> UIView {
        return qlController.previewController.view
    }
}

class QLViewController: UIViewController, QLPreviewControllerDataSource {
    let previewController = QLPreviewController()
    var documentURL: URL?

    func changeUrl(docUrl: URL) {
        documentURL = docUrl
        previewController.dataSource = self
    }

    func presentToView() {
        present(previewController, animated: true, completion: nil)
    }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return documentURL! as QLPreviewItem
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return documentURL != nil ? 1 : 0
    }
}
