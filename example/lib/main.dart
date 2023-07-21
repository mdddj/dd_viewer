
import 'package:dd_viewer/dd_viewer.dart';
import 'package:dd_viewer/model/filex.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

import 'doc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final pdfUrl = "http://ip:port/wd/pdf.pdf";
  final excUrl = "http://ip:port/wd/excel.xls";
  final docUrl = "http://ip:port/wd/文档.docx";
  final jpg = 'http://ip:port/wd/3.jpg';
  final png = 'http://ip:port/wd/2.png';
  final jpeg = 'http://ip:port/wd/1.jpeg';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('超级视图'),
          actions: [
              Builder(
                builder: (c) {
                  return FilledButton.tonal(onPressed: (){
                    Navigator.push(c, MaterialPageRoute(builder: (_)=>const DocView()));
                  }, child: const Text('doc页面测试'));
                }
              )
          ],
        ),
        body: GridView.count(crossAxisCount: 2,children: [
          SuperView(file: FileX.netWork(url: docUrl)),
          // SuperView(file: FileX.netWork(url: excUrl)),
          FilledButton(onPressed: (){
            DdViewerApi().openXlsFile(FileX.netWork(url: 'http://ip:port/wd/excel.xls'));
          }, child: const Text('打开xls')),
          SuperView(file: FileX.netWork(url: pdfUrl)),

          SuperView(file: FileX.netWork(url: jpg)),
          SuperView(file: FileX.netWork(url: png)),
          SuperView(file: FileX.netWork(url: jpeg)),
        ],),
      ),
    );
  }

  void isXlsFile() {
    final fileType = getFileType('http://ip:port/wd/excel.xls');
    if(fileType == SupportFile.xls){
      DdViewerApi().openXlsFile(FileX.netWork(url: 'http://ip:port/wd/excel.xls'));
    }
  }

  SupportFile  getFileType(String url) {
    final ex = path.extension(url);
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
