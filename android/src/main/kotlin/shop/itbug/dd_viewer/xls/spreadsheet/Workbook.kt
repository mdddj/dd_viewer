package shop.itbug.dd_viewer.xls.spreadsheet

import shop.itbug.dd_viewer.xls.spreadsheet.Sheet


open class Workbook {

    var sheetList: MutableList<Sheet> = mutableListOf()

    var currentSheet : Int

    init {
        val sheet = Sheet()
        sheetList.add(sheet)
        currentSheet = 0
    }


}