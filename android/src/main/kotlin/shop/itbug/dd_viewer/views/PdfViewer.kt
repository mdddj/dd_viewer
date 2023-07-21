package shop.itbug.dd_viewer.views

import android.app.Activity
import android.content.Context
import android.view.LayoutInflater
import android.view.View
import com.github.barteksc.pdfviewer.PDFView
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import shop.itbug.dd_viewer.R
import java.io.File
import java.net.URL
import kotlin.concurrent.thread


///视图工厂
class PdfViewerFactory(
    private val flutterPluginBinding: FlutterPlugin.FlutterPluginBinding,
    private val activity: Activity
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return MyPdfViewer(flutterPluginBinding, viewId, activity, context)
    }
}

private val PDF_METHOD_CHANNEL_NAME = "my_pdf_method_"

///PDF视图组件
class MyPdfViewer(
    flutterPluginBinding: FlutterPlugin.FlutterPluginBinding,
    viewId: Int,
    activity: Activity,
   val context: Context
) : PlatformView, MethodChannel.MethodCallHandler {


    private var root  = LayoutInflater.from(context).inflate(R.layout.my_pdf_viewer,null)
    private var myPdfViewer: PDFView = root.findViewById(R.id.my_pdf_viewer)
    private var methodChannel: MethodChannel =
        MethodChannel(flutterPluginBinding.binaryMessenger, "$PDF_METHOD_CHANNEL_NAME$viewId")

    init {
        methodChannel.setMethodCallHandler(this)
    }

    override fun getView(): View {
        return root
    }

    override fun dispose() {
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        log(":===============================${call.method}===============================")
        when (call.method) {
            "loadFromUrl" -> {
                val url = call.argument<String>("url")!!
                loadFromUrl(url, result)
            }
            "loadPages" -> {
                log("加载页面")
                myPdfViewer.loadPages()
                result.success(true)
            }
            "zoomWithAnimation" -> {
                val value = call.argument<Double>("zoom") ?: 1.0
                zoomWithAnimation(value.toFloat())
                result.success(true)
            }
            "fitToWidth" -> {
                fitToWidth(call, result)
            }

            "open-xls" -> {

            }

            else -> {
                log("未实现的方法")
                result.notImplemented()
            }
        }
    }



    ///在线程中执行网络请求
    private fun loadFromUrl(url : String, result: MethodChannel.Result) {
        thread {
            try {
                val url1 = File(url)
                val fromUri = myPdfViewer.fromFile(url1)
                fromUri.apply {

                    this.onError {
                        result.error("10002",it.message.toString(),it.stackTrace)
                    }
                    load()
                }

                result.success(true)
            }catch (e:Exception){
                e.printStackTrace()
                result.error("10001",e.message.toString(),e.localizedMessage)
            }
        }
    }


    private fun zoomWithAnimation(float: Float) {
        myPdfViewer.zoomWithAnimation(float)
    }


    private fun fitToWidth(call: MethodCall, result: MethodChannel.Result)  {
        val page = call.argument<Int>("page") ?: 0
        myPdfViewer.fitToWidth(page)
        result.success(true)
    }

    private fun log(msg: String) {
     Log.d(MyPdfViewer::class.java.simpleName,msg)
    }
}