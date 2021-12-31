//
//  Create.swift
//  MessagePredictor
//
//  Created by Casey Traina on 2/6/21.
//

import Foundation
import SQLite
import SQLite3
import Cocoa

let createTableString = """
CREATE TABLE IF NOT EXISTS MyData(
guid TEXT,
text TEXT,
handle_id INT,
is_from_me INT,
reply_to_guid TEXT);
"""

func createTable() {
  // 1
    let group = DispatchGroup()
    var createTableStatement: OpaquePointer?
      // 2
      if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
        // 3
        if sqlite3_step(createTableStatement) == SQLITE_DONE {
          print("\nContact table created.")
            output = "\nContact table created."
    //        let alert = NSAlert()
    //        alert.informativeText = output
    //        alert.runModal()
        } else {
            print("\nContact table could not be created.")
            output = "\nContact table could not be created."
            let alert = NSAlert()
            alert.informativeText = output
            alert.runModal()
        }
      } else {
        print("\nCREATE TABLE statement could not be prepared.")
        output = "\nCREATE TABLE statement could not be prepared."
    //    let alert = NSAlert()
    //    alert.informativeText = output
    //    alert.runModal()
      }
      // 4
      sqlite3_finalize(createTableStatement)
    }
