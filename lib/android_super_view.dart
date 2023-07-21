part of dd_viewer;


enum SupportFile {
  xls,pdf,word,noSupport,img
}

class AndroidSupportView extends StatelessWidget {
  final FileX fileX;
  const AndroidSupportView({super.key, required this.fileX});

  @override
  Widget build(BuildContext context) {
    assert(getFileType!=SupportFile.xls,"\n\n\n=====================请使用函数打开xls文件====================\n\n\n       eg.\n\n"
        """
        void openXlsFile() { 
            DdViewerApi().openXlsFile(FileX.netWork(url: 'http://221.234.36.40:8888/wd/excel.xls'));
        }\n\n\n
        """
        " \n\n\n");
    switch(getFileType){
      case SupportFile.pdf:
        return DdPdfView(fileX: fileX);
      case SupportFile.xls:
        // return ExcelWidget(fileX: fileX);
        return const Text('请使用函数打开xls文件');
      case SupportFile.img:
        return AndroidImageView(fileX: fileX);
      case SupportFile.word:
        return WordViewer(fileX: fileX);
      default:
        return  Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: Text('暂不支持的文件类型,代码编写中$getFileType'));
    }
  }


  void openXlsFile() {
    DdViewerApi().openXlsFile(FileX.netWork(url: 'http://221.234.36.40:8888/wd/excel.xls'));
  }

  ///获取文件类型
  SupportFile get getFileType {
    return fileX.map(netWork: (NetWorkFileX url){
      return url.url.fileType;
    }, file: (LocalFileFileX f){
      return f.file.path.fileType;
    }, path: (LocalPathFileX p){
      return p.path.fileType;
    });
  }


}

extension _FileEx on String {
  SupportFile get fileType {
    final ex = path.extension(this);
    switch(ex){
      case '.xls':
        return SupportFile.xls;
      case '.pdf':
        return SupportFile.pdf;
      case '.docx':
        return SupportFile.word;
      case '.jpg':
        return SupportFile.img;
      case '.png':
        return SupportFile.img;
      case '.jpeg':
        return SupportFile.img;
      default:
        return SupportFile.noSupport;
    }
  }
}
