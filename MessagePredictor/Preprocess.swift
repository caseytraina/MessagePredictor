//
//  Preprocess.swift
//  MessagePredictor
//
//  Created by Casey Traina on 5/11/21.
//

import Foundation

func preprocess() {

    for i in 0..<messageDataArray.count {

        for def in slangDict {
            
            var textWords = messageDataArray[i].text.components(separatedBy: " ")
            var replyWords = messageDataArray[i].replyTo.components(separatedBy: " ")
            
            for a in 0..<textWords.count {
                if textWords[a] == def.slang {
                    textWords[a] = "\(def.meaning)"
                }
            }
            
            let newText = textWords.joined(separator: " ")

            messageDataArray[i].text = newText
           
            for a in 0..<replyWords.count {
                if replyWords[a] == def.slang {
                    replyWords[a] = "\(def.meaning)"
                }
            }
            
            let newReply = replyWords.joined(separator: " ")

            messageDataArray[i].replyTo = newReply
            
//            if messageDataArray[i].text.contains("\(word.slang)") {
//                messageDataArray[i].text = messageDataArray[i].text.replacingOccurrences(of: "\(word.slang)", with: "\(word.meaning)")
//                messageDataArray[i].text = messageDataArray[i].text.replacingOccurrences(of: "\(word.slang)", with: "\(word.meaning)")
//            }
//            if messageDataArray[i].replyTo.contains("\(word.slang)") {
//                messageDataArray[i].text = messageDataArray[i].text.replacingOccurrences(of: "\(word.slang)", with: "\(word.meaning)")
//            }
        }
    }
    
}
