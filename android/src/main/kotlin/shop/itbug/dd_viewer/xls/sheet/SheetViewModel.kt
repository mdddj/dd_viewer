package shop.itbug.dd_viewer.xls.sheet

import android.content.ContentResolver
import android.net.Uri
import android.webkit.MimeTypeMap
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Transformations
import androidx.lifecycle.ViewModel
import shop.itbug.dd_viewer.xls.PullState
import shop.itbug.dd_viewer.xls.spreadsheet.Spreadsheet
import java.io.File
import java.io.IOException

class SheetViewModel : ViewModel() {

    val spreadsheet = MutableLiveData<Spreadsheet>()
    private val uri = MutableLiveData<Uri>()
    private val contentResolver = MutableLiveData<ContentResolver>()
    var jumpCell = MutableLiveData<String>()

    var leftColumn : Int = 1
    var topRow : Int = 1

    private val sheetLoad = MutableLiveData<PullState>()
    val sheetLoadState: LiveData<PullState> = Transformations.switchMap(sheetLoad) {
        readTextFromUri(uri.value, contentResolver.value)
    }

    fun setTheJumpCell(cell : String) {
        setJumping(cell)
        jumpCell.value = cell
    }

    fun processUri(pUri: Uri, pContentResolver: ContentResolver) {
        uri.value = pUri
        contentResolver.value = pContentResolver
        sheetLoad.value = PullState.LOADING
    }

    @Throws(IOException::class)
    fun readTextFromUri(uri: Uri?, contentResolver: ContentResolver?) : LiveData<PullState> {
        val pullState = MutableLiveData<PullState>()
        pullState.value = PullState.LOADING

        val mimeType = getMimeType(contentResolver, uri)


        if (uri != null) {
            contentResolver?.openInputStream(uri)?.use { inputStream ->
                spreadsheet.value = Spreadsheet(inputStream, mimeType)
                pullState.value = PullState.LOADED_ACK
            }
        }

        return pullState
    }


    private fun getMimeType(cr: ContentResolver?, uri: Uri?): String? {
        return if (uri?.scheme == ContentResolver.SCHEME_CONTENT) {
            MimeTypeMap.getSingleton().getExtensionFromMimeType(cr?.getType(uri))
        } else {
            MimeTypeMap.getFileExtensionFromUrl(Uri.fromFile(uri?.path?.let { File(it) }).toString())
        }
    }

    private fun setJumping(jumpCell: String) {
        val letter: String
        val number: String

        if (jumpCell.isNotEmpty() && jumpCell.matches("^[A-Za-z]+[0-9]+".toRegex())) {
            number = jumpCell.replace("[A-Za-z]".toRegex(), "")
            letter = jumpCell.replace("[0-9]".toRegex(), "")
            val letterNum = doLetter(letter)
            val numberNum = number.toInt()
            topRow = numberNum
            leftColumn = letterNum
        } else {
            topRow = 1
            leftColumn = 1
        }
    }


    private fun doLetter(letter: String): Int {

        val zero = letter[0].toString()
        val numZero = letterToNumber(zero)

        if (letter.length > 1) {
            val one = letter[1].toString()
            val numOne = letterToNumber(one)
            if (letter.length > 2) {
                val two = letter[2].toString()
                val numTwo = letterToNumber(two)
                return numZero * 26 * 26 + numOne * 26 + numTwo
            }
            return numZero * 26 + numOne
        } else {
            return numZero
        }
    }


    private fun letterToNumber(letter: String): Int {

        val n: Int

        when (letter) {
            "A" -> n = 1
            "B" -> n = 2
            "C" -> n = 3
            "D" -> n = 4
            "E" -> n = 5
            "F" -> n = 6
            "G" -> n = 7
            "H" -> n = 8
            "I" -> n = 9
            "J" -> n = 10
            "K" -> n = 11
            "L" -> n = 12
            "M" -> n = 13
            "N" -> n = 14
            "O" -> n = 15
            "P" -> n = 16
            "Q" -> n = 17
            "R" -> n = 18
            "S" -> n = 19
            "T" -> n = 20
            "U" -> n = 21
            "V" -> n = 22
            "W" -> n = 23
            "X" -> n = 24
            "Y" -> n = 25
            "Z" -> n = 26
            else -> n = 1
        }
        return n
    }

}
