//
//  Factory.swift
//  dd_viewer
//
//  Created by ldd on 2023/6/27.
//
import SwiftUI
import Flutter

class QlPreviewFactory : NSObject,FlutterPlatformViewFactory {
    var flutter : FlutterPluginRegistrar
    
    init(flutter: FlutterPluginRegistrar) {
        self.flutter = flutter
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return QlPreView(flutterRegistrar: flutter, documentURL: nil, viewId: viewId)
    }
    
    
}
