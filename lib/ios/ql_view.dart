part of dd_viewer;

const iosQlViewId = 'dd_ql_view'; //视图ID

class QlView extends StatefulWidget {
  final FileX filex;
  final ValueChanged<QlController>? onCreated;

  const QlView({super.key, required this.filex, this.onCreated});

  @override
  State<QlView> createState() => _QlViewState();
}

class _QlViewState extends State<QlView> {
  late QlController controller;

  @override
  Widget build(BuildContext context) {
    return UiKitView(viewType: iosQlViewId, onPlatformViewCreated: _created);
  }

  Future<void> _created(int id) async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller = QlController('$id');
      widget.onCreated?.call(controller);
      _urlHandle();
    });
  }


  ///打开文件
  Future<void> _urlHandle() async {
     final filePath = await widget.filex.getOpenPath();
     final result = await controller.setUrl(filePath);
     debugPrint("设置URL是否成功:$result");
     if(result){
       final isPresent = await controller.present();
       debugPrint("视图是否初始化成功:$isPresent");
     }
  }
}
