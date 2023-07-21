import 'dart:io';

import 'package:dd_viewer/dd_viewer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filex.freezed.dart';

extension FileXEx on FileX {
  Future<String> getOpenPath() async {
    if(this is NetWorkFileX){
      final saveFile = await DdDownloadUtil.download((this as NetWorkFileX).url);
      return saveFile.path;
    }
    return map<String>(netWork: (value)  {
      return "";
    }, file: (value) {
      return value.file.path;
    }, path: (value) {
      return value.path;
    },);
  }
}

@freezed
class FileX with _$FileX {
  const FileX._();

  factory FileX.netWork({required String url, FileXType? fileXType}) =
      NetWorkFileX;

  factory FileX.file({required File file, FileXType? fileXType}) =
      LocalFileFileX;

  factory FileX.path({required String path, FileXType? fileXType}) =
      LocalPathFileX;
}

///打开的文件类型
enum FileXType {
  xls("application/vnd.ms-excel"),
  xlsx("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

  const FileXType(this.type);

  final String type;
}
