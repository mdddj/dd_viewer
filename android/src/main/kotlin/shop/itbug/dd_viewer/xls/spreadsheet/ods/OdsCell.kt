package shop.itbug.dd_viewer.xls.spreadsheet.ods

import shop.itbug.dd_viewer.xls.spreadsheet.Cell


class OdsCell(string: String) : Cell() {

    init {
        cellValue = string
    }

}