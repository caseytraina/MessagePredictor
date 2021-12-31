//
//  iCloud.swift
//  MessagePredictor
//
//  Created by Casey Traina on 5/18/21.
//

import Foundation
import CloudKit
import Dispatch

//
//func iCloud() {
////    let record = CKRecord(recordType: "name")
////    let predicate = NSPredicate(value: true)
////
////    let myQuery = CKQuery(recordType: "texts", predicate: predicate)
////
////    let operation = CKQueryOperation(query: myQuery)
////    operation.recordFetchedBlock = { word in
////        print(word)
////    }
////
////
////    CKContainer.default().publicCloudDatabase.add(operation)
////    print(operation)
////    print(myQuery)
//    
//    let publicDatabase = CKContainer.default().publicCloudDatabase
//
//    let predicate = NSPredicate(value: true)
//
//    let myQuery = CKQuery(recordType: "texts", predicate: predicate)
//
//    publicDatabase.perform(myQuery, inZoneWith: nil,
//                    completionHandler: ({results, error in
//
//                        if (error != nil) {
//                            DispatchQueue.main.async {
//                                print("Cloud Error")
//                            }
//                        } else {
//                            if results!.count > 0 {
//
//
//                    DispatchQueue.main.async {
//
//
//             for entry in results! {
//             let text = entry["texts"] as? String
//             print("texts from CloudKit \(text)")
//
//
//              }
//                }
////                                else {
////               DispatchQueue.main.async {
////                                    print("UPC Not Found")
////                                }
////                            }
//                        }
//                        }))
//                    }
