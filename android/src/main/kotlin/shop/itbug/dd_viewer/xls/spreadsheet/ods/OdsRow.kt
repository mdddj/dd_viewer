package shop.itbug.dd_viewer.xls.spreadsheet.ods

import shop.itbug.dd_viewer.xls.spreadsheet.Row


class OdsRow : Row() {
    init {
        cellList = mutableListOf()
    }

    fun add(odsCell : OdsCell) {
        cellList.add(odsCell)
    }
}
