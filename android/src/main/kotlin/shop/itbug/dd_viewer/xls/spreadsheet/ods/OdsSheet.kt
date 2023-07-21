package shop.itbug.dd_viewer.xls.spreadsheet.ods

import shop.itbug.dd_viewer.xls.spreadsheet.Sheet


// XXX: We can probably rename this to OdsTable if we want to
class OdsSheet : Sheet() {

    init {
        rowList = mutableListOf()
    }

    fun add(odsRow: OdsRow) {
        rowList.add(odsRow)
    }

}