part of dd_viewer;

class WordViewer extends StatefulWidget {
  final FileX fileX;
  const WordViewer({super.key, required this.fileX});

  @override
  State<WordViewer> createState() => _WordViewerState();
}

class _WordViewerState extends State<WordViewer> {
  var pdfFile = "";
  var loading = false;


  @override
  void initState() {
    Future.microtask(_start);
    super.initState();
  }


  ///开始处理文件
  Future<void> _start() async {
     final docFile = await widget.fileX.getOpenPath();
     final filename = path.basenameWithoutExtension(docFile);
     print("文件名:$filename");
     final savePath = await DdDownloadUtil.getSavePath();
     final toFile = File('$savePath/$filename'+'.pdf');
     print("转换后路径:${toFile.path}");
     final result = await DdViewerApi().wordToPdf(docFile, toFile.path);
     print("是否成功:$result");
     if(result){
       pdfFile = toFile.path;
       setState(() { });
     }
  }

  @override
  Widget build(BuildContext context) {
    return pdfFile.isNotEmpty ? DdPdfView(fileX: FileX.path(path: pdfFile)) : const SizedBox();
  }


  @override
  void setState(VoidCallback fn) {
    if(mounted){
      super.setState(fn);
    }
  }
}
