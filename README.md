# dd_viewer

A universal preview device for PDF, Word, Excel, text, png, and jpg

一个办公预览套件,支持预览pdf,excel,word等类型文件

不依赖腾讯TBS

Android使用框架:

`iTextPdf`: word转pdf预览

`apache.poi`: 解析excel,绘制表格预览



Ios使用系统自带`QuickLook`预览



# ios
请在Podfile文件中,设置最低版本为12
```bash
platform :ios, '12.0'

config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
```

举个例子:
```bash
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
  end
end
```

# Android
在`android/build.gradle`添加
```bash
maven { url "https://jitpack.io" }
```


# 打开Excel文件

```dart
DdViewerApi().openXlsFile(FileX.netWork(url: 'http://host:port/wd/excel.xls'));
```


# 使用

支持打开网络文件,本地文件,网络文件使用dio下载到本地缓存目录
```dart
file: FileX.netWork();
file: FileX.file();
file: FileX.path();
```

完整例子
```dart
import 'package:dd_viewer/dd_viewer.dart';
import 'package:dd_viewer/model/filex.dart';
import 'package:flutter/material.dart';

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

  final pdfUrl = "http://host:port/wd/pdf.pdf";
  final excUrl = "http://host:port/wd/excel.xls";
  final docUrl = "http://host:port/wd/文档.docx";
  final jpg = 'http://host:port/wd/3.jpg';
  final png = 'http://host:port/wd/2.png';
  final jpeg = 'http://host:port/wd/1.jpeg';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('超级视图'),
        ),
        body: GridView.count(crossAxisCount: 2,children: [
          SuperView(file: FileX.netWork(url: docUrl)),
          SuperView(file: FileX.netWork(url: excUrl)),
          SuperView(file: FileX.netWork(url: pdfUrl)),

          SuperView(file: FileX.netWork(url: jpg)),
          SuperView(file: FileX.netWork(url: png)),
          SuperView(file: FileX.netWork(url: jpeg)),
        ],),
      ),
    );
  }

}
```

