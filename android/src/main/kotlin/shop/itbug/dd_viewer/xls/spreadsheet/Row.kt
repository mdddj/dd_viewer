package shop.itbug.dd_viewer.xls.spreadsheet

import shop.itbug.dd_viewer.xls.spreadsheet.Cell


open class Row {

    var cellList : MutableList<Cell> = mutableListOf()

    var height = 60

    fun getCell(column : Int) : Cell {
        while(cellList.size <= column) {
            cellList.add(Cell())
        }
        return cellList[column]
    }

}