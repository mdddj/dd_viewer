part of dd_viewer;

class ExcelWidget extends StatefulWidget {
  final FileX fileX;
  const ExcelWidget({super.key, required this.fileX});
  @override
  State<ExcelWidget> createState() => _WebViewXState();
}

class _WebViewXState extends State<ExcelWidget> {
  late WebViewXController controller;
  @override
  Widget build(BuildContext context) {
    return AndroidView(viewType: "dd_webview-x",onPlatformViewCreated: _onCreated);
  }

  ///视图创建
  void _onCreated(int id) {
    controller = WebViewXController(id);
    controller.loadUrl(widget.fileX);
  }


}


 class WebViewXController {
  final int id;
  WebViewXController(this.id);
  late final methodChannel = MethodChannel('dd_web_view_x_$id');

  ///加载链接
  Future<bool> loadUrl(FileX file) async {
    await Permission.storage.request();
    final openPath = await file.getOpenPath();
    Logger().i({
      "open file": openPath
    });
    if(openPath.isEmpty){
      Logger().e("fail to open file");
      return false;
    }
    final result = await methodChannel.invokeMethod<bool>("url",<String,dynamic>{"url":openPath,"type": file.fileXType?.type});
    return result ?? false;
  }

}
