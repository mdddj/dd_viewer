part of dd_viewer;

class QlController {
  final String viewId;

  QlController(this.viewId);

  late MethodChannel methodChannel = MethodChannel('dd_view_$viewId');

  ///设置URL
  Future<bool> setUrl(String filePath) async {
    final result =
        await methodChannel.invokeMethod<bool>("set-url", {"path": filePath});
    return result ?? false;
  }

  ///初始化视图
  Future<bool> present() async {
    final result = await methodChannel.invokeMethod<bool>("present");
    return result ?? false;
  }

  ///重新打开某个文件
  Future<bool> reOpen(FileX fileX) async {
    final filePath = await fileX.getOpenPath();
    var isSuccess = await setUrl(filePath);
    isSuccess = await present();
    return isSuccess;
  }
}
