//
//  Query.swift
//  MessagePredictor
//
//  Created by Casey Traina on 2/6/21.
//

import Foundation
import SQLite
import SQLite3


let queryStatementString = "SELECT guid, text, handle_id, is_from_me, reply_to_guid FROM message;"

func query() {
    
    
  var queryStatement: OpaquePointer?
  if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
    print("\n")
    
    while (sqlite3_step(queryStatement) == SQLITE_ROW) {
        var guid: String
        var text: String
        var recipient: String
        var isFromMe: String
        var replyGuid: String
        
        if let queryResultCol1 = sqlite3_column_text(queryStatement, 0) {
            guid = String(cString: queryResultCol1)
        } else {
            guid = "nil"
        }
        if let queryResultCol2 = sqlite3_column_text(queryStatement, 1) {
            text = String(cString: queryResultCol2)
        } else {
            text = "nil"
        }
        if let queryResultCol3 = sqlite3_column_text(queryStatement, 2) {
            recipient = String(cString: queryResultCol3)
        } else {
            recipient = "nil"
        }
        if let queryResultCol4 = sqlite3_column_text(queryStatement, 3) {
            isFromMe = String(cString: queryResultCol4)
        } else {
            isFromMe = "nil"
        }
        if let queryResultCol5 = sqlite3_column_text(queryStatement, 4) {
            replyGuid = String(cString: queryResultCol5)
        } else {
            replyGuid = "nil"
        }
        
        counter+=1
        
        let i = MessageData(recipient: recipient, text: text, guid: guid, isFromMe: isFromMe, replyTo: replyGuid, textClassification: ("unknown", "unknown"), replyToClassification: ("unknown", "unknown"))
        messageDataArray.append(i)
        
    }
  } else {
      let errorMessage = String(cString: sqlite3_errmsg(db))
      print("\nQuery is not prepared \(errorMessage)")
  }
  sqlite3_finalize(queryStatement)
    
}

