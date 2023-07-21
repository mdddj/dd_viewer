
import 'package:dd_viewer/dd_viewer.dart';
import 'package:dd_viewer/model/filex.dart';
import 'package:flutter/material.dart';

class DocView extends StatefulWidget {
  const DocView({super.key});

  @override
  State<DocView> createState() => _DocViewState();
}

class _DocViewState extends State<DocView> {
  final docUrl = "http://221.234.36.40:8888/wd/文档.docx";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('doc视图')),
      body: SizedBox(
          child: SuperView(file: FileX.netWork(url: docUrl))),
    );
  }
}
