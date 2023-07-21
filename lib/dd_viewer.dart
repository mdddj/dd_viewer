library dd_viewer;

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dd_viewer/model/filex.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
part 'pdf/dd_pdf_view.dart';
part 'webview/widget.dart';
part 'util/download.dart';
part 'ios/ql_view.dart';
part 'ios/ql_controller.dart';
part 'view.dart';
part 'android_super_view.dart';
part 'android/image_view.dart';
part 'android/word_view.dart';
class DdPdfViewerController {

  final int viewId;

  late MethodChannel channel;
  DdPdfViewerController(this.viewId){
    channel = MethodChannel("my_pdf_method_$viewId");
  }


  ///加载远程PDF文件
  Future<bool> loadPdfFromUri(String urlPath) async {
   try{
     final result =  await channel.invokeMethod<bool>("loadFromUrl",<String,dynamic>{"url": urlPath});
     return result ?? false;
   } on PlatformException catch(e){
     Logger().e({
       "code":e.code,
       "msgs":e.message
     });
     return false;
   }
  }

  Future<bool> loadPages() async {
    final value =  await channel.invokeMethod("loadPages");
    return value ?? false;
  }

  Future<bool> zoomWithAnimation(double value) async {
   final result =  await channel.invokeMethod("zoomWithAnimation",{"zoom":value});
   return result ?? false;
  }

  Future<bool> fitToWidth([int page = 0]) async {
    final result =  await channel.invokeMethod("fitToWidth",{"page":page});
    return result ?? false;
  }

  Future<bool> openXls(String url) async {
    final result = await channel.invokeMethod("open-xls",{"url":url});
    return result ?? false;
  }
}


class DdViewerApi {
  final methodChannel = const MethodChannel("dd_viewer_api");

  /// word 转pdf
  Future<bool> wordToPdf(String docPath,String pdfPath) async {
    try{
      final result = await methodChannel.invokeMethod("docx-to-pdf",{
        "docPath":docPath,
        "toPath":pdfPath
      });
      return result??false;
    }on PlatformException catch(e){
      Logger().e({
        "code":e.code,
        "msgs":e.message
      });
      return false;
    }
  }

  /// 打开一个xls类型的文件
  Future<bool> openXlsFile(FileX fileX) async {
    await Permission.storage.request();
    final openPath = await fileX.getOpenPath();
    if(openPath.isEmpty){
      Logger().e("fail to open file");
      return false;
    }
    final result = await methodChannel.invokeMethod<bool>("open-excel",<String,dynamic>{"url":openPath,"type": fileX.fileXType?.type});
    return result ?? false;
  }
}