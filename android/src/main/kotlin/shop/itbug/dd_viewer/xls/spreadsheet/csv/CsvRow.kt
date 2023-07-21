package shop.itbug.dd_viewer.xls.spreadsheet.csv

import shop.itbug.dd_viewer.xls.spreadsheet.Row

class CsvRow(line: String) : Row() {

    init {

        var thisString = ""
        for (i in 0 until line.length) {
            val c = line[i]
            if (c == ',') {
                val csvCell = CsvCell(thisString)
                cellList.add(csvCell)

                thisString = ""
            } else {
                thisString = thisString + c
            }
        }

        // last one
        // TODO: Deal with last column with trailing ^M and such
        if (thisString.length > 0) {
            val csvCell = CsvCell(thisString)
            cellList.add(csvCell)
        }

    }
}