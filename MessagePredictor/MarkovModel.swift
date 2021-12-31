//
//  MarkovModel.swift
//  MessagePredictor
//
//  Created by Casey Traina on 5/20/21.
//

import Foundation
import MarkovModel


func classifyNew(incoming: String) -> (corpus: [String], meanLength: Int) {
    
    let emotionClassifier = emotionClassification()
    let intentClassifier = intentClassification()
    
    guard let emotion = try? emotionClassifier.prediction(text: incoming) else {
        fatalError("Unexpected runtime error.")
    }
    guard let intent = try? intentClassifier.prediction(text: incoming) else {
        fatalError("Unexpected runtime error.")
    }
    
    var texts = [String]()
    var corpus = [String]()
    
    // emotion, intent
    
    for i in messageDataArray {
        if "\(i.replyToClassification.0)" == "\(emotion)" {
            if "\(i.replyToClassification.1)" == "\(intent)" {
                texts.append(i.text)
            }
        }
    }
    var sum = 0
    var components = [String]()
    for text in texts {
        var components = text.components(separatedBy: " ")
        sum += components.count
        
        for word in components {
            corpus.append(word)
        }
    }
    
    for i in texts {
        var firstWord = i.components(separatedBy: " ")[0]
    }
    
    var meanLength: Double = Double(sum/components.count)
    meanLength = round(meanLength)
    
    
    return (corpus, Int(meanLength))
}

func generateText(transitions: Array<String>, first: String) -> String {
    var text = [first]
    let markovModel = MarkovModel(transitions: transitions)
    var isNotNil = true
    var i = 0
    
    while isNotNil == true {
        var next = markovModel.chain.next(given: transitions[i])
        
        if next == nil {
            isNotNil = false
        } else if next != nil {
            text.append("\(String(describing: next))")
            i += 1
        }
    }
    
    
    return text.joined(separator: " ")
}



func test() {
    let markovModel = MarkovModel(transitions: ["Never", "gonna", "give", "you", "up", "never", "gonna", "let", "you", "down"])
    
    var array = ["Never", "gonna", "give", "you", "up", "never", "gonna", "let", "you", "down"]

    for i in 0..<10 {
        var word = markovModel.chain.next(given: array[i], process: .predict)
        print(word)
        
        if word == nil {
            print("ah")
        }
    }
}
