part of dd_viewer;

class AndroidImageView extends StatefulWidget {
  final FileX fileX;
  const AndroidImageView({super.key, required this.fileX});

  @override
  State<AndroidImageView> createState() => _AndroidImageViewState();
}

class _AndroidImageViewState extends State<AndroidImageView> {

  String _filePath = "";
  bool _loading = false;



  @override
  void initState() {
    super.initState();
    Future.microtask(() {

      setState(() {
        _loading = true;
      });

       widget.fileX.getOpenPath().then((value) {
         setState(() {
           _loading = false;
           _filePath = value;
         });
       });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading ? const Center(child: CircularProgressIndicator()) :  (_filePath.isEmpty ? const Text('load error') : Image.file(File(_filePath)));
  }




  @override
  void setState(VoidCallback fn) {
    if(mounted){
      super.setState(fn);
    }

  }
}
