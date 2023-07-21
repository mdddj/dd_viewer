part of dd_viewer;

///梁典典的PDF view
class DdPdfView extends StatefulWidget {
  final ValueChanged<DdPdfViewerController>? onCreated;
  final ValueChanged<DdPdfViewerController>? onLoaded;
  final FileX? fileX;
  const DdPdfView({super.key,  this.onCreated,  this.fileX, this.onLoaded});

  @override
  State<DdPdfView> createState() => _DdPdfViewState();
}

class _DdPdfViewState extends State<DdPdfView> {
  late DdPdfViewerController _controller;


  FileX? get _initUrl => widget.fileX;

  @override
  Widget build(BuildContext context) {
    return AndroidView(viewType: "dd_pdf-viewer",onPlatformViewCreated: _onPlatformViewCreated);
  }

  ///view created
  void _onPlatformViewCreated(int id) {
    _controller = DdPdfViewerController(id);
    widget.onCreated?.call(_controller);
    _onInitLoad();
  }

  ///初始化
  Future<void> _onInitLoad() async {
    if(_initUrl!=null){
      final filePath = await _initUrl!.getOpenPath();
      _controller.loadPdfFromUri(filePath).then((value) {
        _controller.loadPages();
        widget.onLoaded?.call(_controller);
      });
    }
  }
}
