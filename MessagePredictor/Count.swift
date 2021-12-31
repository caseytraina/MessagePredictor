//
//  Count.swift
//  MessagePredictor
//
//  Created by Casey Traina on 2/6/21.
//

import Foundation
import SQLite
import SQLite3

var totalRows: Int?
var counter = 0

let countStatementString = "SELECT COUNT(*) FROM message;"

func count() {
  var countStatement: OpaquePointer?
  if sqlite3_prepare_v2(db, countStatementString, -1, &countStatement, nil) ==
      SQLITE_OK {
    if sqlite3_step(countStatement) == SQLITE_ROW {
        let count = sqlite3_column_int(countStatement, 0);
        totalRows = Int(count)
        print(totalRows)
  } else {
      print("\nQuery returned no results.")
  }
  } else {
    let errorMessage = String(cString: sqlite3_errmsg(db))
    print("\nQuery is not prepared \(errorMessage)")
  }
  sqlite3_finalize(countStatement)
}
