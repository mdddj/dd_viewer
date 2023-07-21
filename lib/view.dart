

part of dd_viewer;


///插件支持的平台
enum SupportPlatform{
  ios,android,unSupport
}

///超级预览组件
class SuperView extends StatelessWidget {
  final FileX file;
  const SuperView({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
     switch(platform){
       case SupportPlatform.ios:
         return QlView(filex: file);
       case SupportPlatform.android:
         return AndroidSupportView(fileX: file);
       case SupportPlatform.unSupport:
         return const Text('未支持的平台');
    }
  }


  ///获取当前设备平台
  SupportPlatform get platform {
    if(Platform.isIOS){
      return SupportPlatform.ios;
    }else if(Platform.isAndroid){
      return SupportPlatform.android;
    }
    return SupportPlatform.unSupport;
  }
}



