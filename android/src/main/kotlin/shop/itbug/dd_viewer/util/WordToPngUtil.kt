package shop.itbug.dd_viewer.util

import android.content.Context
import android.util.Log
import com.itextpdf.text.Document
import com.itextpdf.text.Font
import com.itextpdf.text.FontFactory
import com.itextpdf.text.Paragraph
import com.itextpdf.text.pdf.BaseFont
import com.itextpdf.text.pdf.PdfWriter
import org.apache.poi.xwpf.extractor.XWPFWordExtractor
import org.apache.poi.xwpf.usermodel.XWPFDocument
import shop.itbug.dd_viewer.fontName
import shop.itbug.dd_viewer.saveInputStreamToFile
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.OutputStream


object WordToPngUtil {

    /// doc转pdf
    fun wordToPdf(docFilePath: String,toFilePath: String,context:Context) {
        var k: String? = null
        var fileForPdf: OutputStream? = null
        val fontPath = regTextFont(context)
        Log.d("WordToPngUtil","字体文件:$fontPath")
        val fontBase =
            BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED)
        val fontChinese = Font(fontBase, 10f, Font.NORMAL)
        try {
            val fileName = docFilePath
            //Below Code is for .doc file
            if (fileName.endsWith(".doc")) {
                val doc = XWPFDocument(FileInputStream(fileName))
                val we = XWPFWordExtractor(doc)
                k = we.text
                fileForPdf = FileOutputStream(File(toFilePath))
                we.close()
            } else if (fileName.endsWith(".docx")) {
                val docx = XWPFDocument(FileInputStream(fileName))
                // using XWPFWordExtractor Class
                val we = XWPFWordExtractor(docx)
                k = we.text
                fileForPdf = FileOutputStream(File(toFilePath))
                we.close()
            }
            val document = Document()
            PdfWriter.getInstance(document, fileForPdf)
            document.open()
            document.add(Paragraph(k,fontChinese))
            document.close()
            fileForPdf!!.close()
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    private fun regTextFont(context: Context) : String{
        val ttfFileInputStream = context.resources.assets.open("SIMSUN.ttf")
        val catchDir = context.cacheDir
        val fontCatchFile = File(catchDir.path+File.separator+"SIMSUN.ttf")
        if(fontCatchFile.exists().not()){
            saveInputStreamToFile(ttfFileInputStream,fontCatchFile)
        }
        FontFactory.register(fontCatchFile.path+"", fontName)
        return fontCatchFile.path
    }
}