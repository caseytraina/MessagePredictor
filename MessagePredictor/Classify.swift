//
//  Classify.swift
//  MessagePredictor
//
//  Created by Casey Traina on 4/22/21.
//

import Foundation
import CoreML

func classify() {
    
    preprocess()
    
    let emotionClassifier = emotionClassification()
    let intentClassifier = intentClassification()
    
    for i in 0..<messageDataArray.count {
        guard let textEmotionOutput = try? emotionClassifier.prediction(text: messageDataArray[i].text) else {
            fatalError("Unexpected runtime error.")
        }
        guard let textIntentOutput = try? intentClassifier.prediction(text: messageDataArray[i].text) else {
            fatalError("Unexpected runtime error.")
        }
        guard let replyEmotionOutput = try? emotionClassifier.prediction(text: messageDataArray[i].replyTo) else {
            fatalError("Unexpected runtime error.")
        }
        guard let replyIntentOutput = try? intentClassifier.prediction(text: messageDataArray[i].replyTo) else {
            fatalError("Unexpected runtime error.")
        }
        //MessageDataArray.textclassification = (emotion, intent)
        
        messageDataArray[i].textClassification = (textEmotionOutput.label,
                                                  intent: textIntentOutput.label)
        messageDataArray[i].replyToClassification = (replyEmotionOutput.label, replyIntentOutput.label)

    }
    
    print(messageDataArray[4].text, messageDataArray[4].textClassification)
    print(messageDataArray[4].replyTo, messageDataArray[4].replyToClassification)
    print(messageDataArray[45].text, messageDataArray[45].textClassification)
    print(messageDataArray[45].replyTo, messageDataArray[45].replyToClassification)
    print(messageDataArray[2000].text, messageDataArray[2000].textClassification)
    print(messageDataArray[2000].replyTo, messageDataArray[2000].replyToClassification)
    
}

