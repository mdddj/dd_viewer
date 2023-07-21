package shop.itbug.dd_viewer.views

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Build
import android.view.View
import android.widget.TextView
import androidx.annotation.RequiresApi
import androidx.core.net.toUri
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import shop.itbug.dd_viewer.xls.SheetActivity
import java.io.File


///视图工厂
class WebViewXFactory(
    private val flutterPluginBinding: FlutterPlugin.FlutterPluginBinding,
    private val activity: Activity
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return WebViewX(flutterPluginBinding, viewId, activity, context)
    }
}
private val WEB_VIEW_METHOD_CHANNEL_NAME = "dd_web_view_x_"
class WebViewX(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding,
               viewId: Int,
               val activity: Activity,
               private val context: Context): PlatformView,MethodChannel.MethodCallHandler {


private val textViewPager = TextView(context)

    private var methodChannel: MethodChannel =
        MethodChannel(flutterPluginBinding.binaryMessenger, "$WEB_VIEW_METHOD_CHANNEL_NAME$viewId")


    init {
        methodChannel.setMethodCallHandler(this)
    }

    override fun getView(): View {
        return textViewPager
    }

    override fun dispose() {

    }

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        when(call.method){
            "url" -> {

                activity.requestPermissions(arrayOf(Manifest.permission.WRITE_EXTERNAL_STORAGE),222);
                val uri = call.argument<String>("url")?:""
                val type = call.argument<String>("type") ?: "application/vnd.ms-excel"
                Log.d("浏览文件","uri:$uri")
                val intert = Intent(activity,SheetActivity::class.java).apply {
                    this.action = Intent.ACTION_VIEW
                    this.setDataAndType(File(uri).toUri(),type)
                }
                activity.startActivity(intert)
            }
            else -> {
                result.notImplemented()
            }
        }
    }




}