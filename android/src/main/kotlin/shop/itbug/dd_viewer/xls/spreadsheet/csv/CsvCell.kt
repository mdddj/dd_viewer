package shop.itbug.dd_viewer.xls.spreadsheet.csv

import shop.itbug.dd_viewer.xls.spreadsheet.Cell


class CsvCell(string: String) : Cell() {

    init {
        cellValue = string
    }


}