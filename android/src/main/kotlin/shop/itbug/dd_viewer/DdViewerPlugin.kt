package shop.itbug.dd_viewer

import android.Manifest
import android.app.Activity
import android.content.Intent
import android.os.Build
import androidx.annotation.RequiresApi
import androidx.core.net.toUri
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import shop.itbug.dd_viewer.util.WordToPngUtil
import shop.itbug.dd_viewer.views.PdfViewerFactory
import shop.itbug.dd_viewer.views.WebViewXFactory
import shop.itbug.dd_viewer.xls.SheetActivity
import java.io.File
import java.io.FileOutputStream
import java.io.InputStream

const val fontName = "SIMSUN"
class DdViewerPlugin : FlutterPlugin, ActivityAware, MethodCallHandler {


    private lateinit var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
    private lateinit var pluginMethodChannel: MethodChannel
    private lateinit var activity: Activity

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        flutterPluginBinding = binding
        pluginMethodChannel = MethodChannel(binding.binaryMessenger, "dd_viewer_api")
        pluginMethodChannel.setMethodCallHandler(this)
    }


    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        //视图注册
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "dd_pdf-viewer",
            PdfViewerFactory(flutterPluginBinding, binding.activity)
        )
        //视图注册
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "dd_webview-x",
            WebViewXFactory(flutterPluginBinding, binding.activity)
        )
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    }

    override fun onDetachedFromActivity() {
    }

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "docx-to-pdf" -> {
                try {
                    val f = call.argument<String>("docPath")!!
                    val t = call.argument<String>("toPath")!!
                    WordToPngUtil.wordToPdf(f, t,flutterPluginBinding.applicationContext)
                    result.success(true)
                } catch (e: Exception) {
                    e.printStackTrace()
                    result.error("6000", "docx转pdf失败", e.localizedMessage)
                }
            }
            "open-excel" -> {
                activity.requestPermissions(arrayOf(Manifest.permission.WRITE_EXTERNAL_STORAGE),222);
                val uri = call.argument<String>("url")?:""
                val type = call.argument<String>("type") ?: "application/vnd.ms-excel"
                Log.d("浏览文件","uri:$uri")
                val intert = Intent(activity, SheetActivity::class.java).apply {
                    this.action = Intent.ACTION_VIEW
                    this.setDataAndType(File(uri).toUri(),type)
                }
                activity.startActivity(intert)
            }
            else -> result.notImplemented()
        }
    }
}

fun saveInputStreamToFile(inputStream: InputStream, file: File) {
    inputStream.use { input ->
        FileOutputStream(file).use { output ->
            input.copyTo(output)
        }
    }
}