//
//  MessageData.swift
//  MessagePredictor
//
//  Created by Casey Traina on 2/5/21.
//

/*
 
    Currently I get an index out of range error on my handlingData function, but I know the array is not empty because I print an item right before
 
 */

import Foundation

var progressValue = 0.0

let queue = OperationQueue()
struct MessageData {
    
    
    var recipient: String
    var text: String
    var guid: String
    var isFromMe: String
    var replyTo: String
    var textClassification: (String, String)
    var replyToClassification: (String, String)
    
    init(recipient: String, text: String, guid: String, isFromMe: String, replyTo: String, textClassification: (emotion: String, intent: String), replyToClassification: (emotion: String, intent: String)) {
        self.recipient = recipient
        self.text = text
        self.guid = guid
        self.isFromMe = isFromMe
        self.replyTo = replyTo
        self.textClassification = textClassification
        self.replyToClassification = replyToClassification
    }
    
}



