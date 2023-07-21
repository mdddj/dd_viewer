
part of dd_viewer;

class DdDownloadUtil {
  static Future<File> download(String url) async {
    await (Connectivity().checkConnectivity());
    final pathBase = (await getTemporaryDirectory()).path;
    final file = File("$pathBase/${getFilename(url)}");
    await Dio().download(url, file.path,onReceiveProgress: (count,total){
    });
    return file;
  }

  static String getFilename(String url) {
    Uri uri = Uri.parse(url);
    String fileName = uri.pathSegments.last;
    return fileName;
  }

  static Future<String> getSavePath() async  {
    final pathBase = (await getTemporaryDirectory()).path;
    return pathBase;
  }
}