//
//  Delete.swift
//  MessagePredictor
//
//  Created by Casey Traina on 2/6/21.
//

import Foundation
import SQLite
import SQLite3

let deleteStatementString = "DELETE FROM message WHERE text = '';"

func delete() {
    
  var deleteStatement: OpaquePointer?
  while (sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) ==
      SQLITE_OK) {
    if sqlite3_step(deleteStatement) == SQLITE_DONE {
        counter+=1
        print(counter)
    }
  } 
  
  sqlite3_finalize(deleteStatement)
}

