package shop.itbug.dd_viewer.xls.spreadsheet.poi

import org.apache.poi.ss.usermodel.CellType
import org.apache.poi.ss.usermodel.DateUtil
import shop.itbug.dd_viewer.xls.spreadsheet.Cell

class PoiCell() : Cell() {

    private lateinit var pCell: org.apache.poi.ss.usermodel.Cell

    constructor(cell: org.apache.poi.ss.usermodel.Cell) : this() {

        pCell = cell

        val value : String? = when (cell.cellType) {

            //CELL_TYPE_FORMULA CellType.FORMULA
            CellType.FORMULA -> cell.cellFormula

            //CellType.NUMERIC
            CellType.NUMERIC -> if (DateUtil.isCellDateFormatted(cell))
                "" + cell.dateCellValue
            else
                "" + cell.numericCellValue
            //CellType.STRING
            else -> cell.stringCellValue
        }

        if (value != null) {
            cellValue = value
        }

    }
}
