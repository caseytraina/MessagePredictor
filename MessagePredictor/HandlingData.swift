//
//  HandlingData.swift
//  MessagePredictor
//
//  Created by Casey Traina on 2/6/21.
//

import Foundation

var messageDataArray = [MessageData]()

func operate() {


//    let find = FindFile()
//    find.addDependency(find)
//    find.completionBlock = {
//        print("Uploading completed!")
//    }
//    let open = UploadContentOperation()
//    open.addDependency(open)
//    open.completionBlock = {
//        print("Uploading completed!")
//    }


//    queue.addOperations([FindFile, openDB, handleData], waitUntilFinished: true)
    
    let queue = OperationQueue()
    
    let myOp = BlockOperation {
        openDB()
        handleData()
    }
    
    queue.addOperations([myOp], waitUntilFinished: true)
    



//    queue.

}


func handleData() {
//let handleData = BlockOperation {

    print("handling")
    
    if messageDataArray.count > 0 {
    
        for i in 0..<messageDataArray.count {
            
            if i >= 0 && i < messageDataArray.count {
            
                if (messageDataArray[i].text == "nil") {
                    messageDataArray.remove(at: i)
                } else if messageDataArray[i].guid == "nil" {
                    messageDataArray.remove(at: i)
                } else if messageDataArray[i].replyTo == "nil" {
                    messageDataArray.remove(at: i)
                } else if messageDataArray[i].recipient == "nil" {
                    messageDataArray.remove(at: i)
                } else if messageDataArray[i].isFromMe == "nil" {
                    messageDataArray.remove(at: i)
                }
                
            }
        }
    }
    
    print(messageDataArray.count)
    
    print(queue.progress.fractionCompleted)
    reorganize()
    print(messageDataArray.count)

//    decode()
    
}




func reorganize() {
    let copy1 = messageDataArray
    messageDataArray.removeAll()
    
    for i in copy1 {
        for j in copy1 {
            if (j.replyTo == i.guid) {
                if j.isFromMe == "1" {
                    let a = MessageData(recipient: j.recipient, text: j.text.lowercased(), guid: j.guid, isFromMe: j.isFromMe, replyTo: i.text.lowercased(), textClassification: ("unknown", "unknown"), replyToClassification: ("unknown", "unknown"))
                    messageDataArray.append(a)
                }
            }
        }
    }
    
    print("done")

}
