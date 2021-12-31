//
//  GettingData.swift
//  MessagePredictor
//
//  Created by Casey Traina on 1/31/21.
//

import Foundation
import Cocoa
import SQLite3

let home = NSUserName()

var label = ""
let fileManager = FileManager.default
var db: OpaquePointer?

var output = "hello"

func FindFile() {
    
    output = "bye"
    let data = NSOpenPanel()
    
    data.canChooseFiles = true
    data.allowsMultipleSelection = false
    data.canChooseDirectories = false
    data.canDownloadUbiquitousContents = false
    data.isAccessoryViewDisclosed = false
    
    let i = data.runModal()
    
    if(i == NSApplication.ModalResponse.OK){
        print(data.url!)
        print("here: \(data)")
    }
    
    func openDatabase() -> OpaquePointer? {
      var db: OpaquePointer?
        guard let part1DbPath = data.url?.path else {
        print("part1DbPath is nil.")
        return nil
      }
      if sqlite3_open(part1DbPath, &db) == SQLITE_OK {
        print("Successfully opened connection to database at \(part1DbPath)")
        return db
      } else {
        print("Unable to open database.")
        return nil
      }
        
    }
    
    db = openDatabase()
    decode()
}
func openDB() {
//let openDB = BlockOperation {
    
    print("opening...")
    createTable()
    count()
    query()
    print(queue.progress.fractionCompleted)
    print("opened")
}
