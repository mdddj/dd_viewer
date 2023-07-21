import Flutter
import UIKit

public class DdViewerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
      registrar.register(QlPreviewFactory(flutter: registrar), withId: "dd_ql_view")
  }

}
