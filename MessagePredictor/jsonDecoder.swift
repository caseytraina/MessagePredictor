//
//  jsonDecoder.swift
//  MessagePredictor
//
//  Created by Casey Traina on 4/22/21.
//

import Foundation

struct Slang: Codable {

    var slang: String
    var meaning: String
    
    init(slang: String, meaning: String) {
        self.slang = slang
        self.meaning = meaning
    }
    
    
}

var slangDict = [Slang]()

func decode() {
    guard let path = Bundle.main.path(forResource: "slangDict", ofType: "json") else {return}
    
    let url = URL(fileURLWithPath: path)
    
    do {
        let data = try Data(contentsOf: url)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        
        guard let array = json as? [Any] else {return}
        print(array[100])
        for word in array {
            guard let userDict = word as? [String: Any] else {return}
            guard let slang = userDict["Slang"] as? String else {return}
            guard let meaning = userDict["Meaning"] as? String else {return}

            let a = Slang(slang: slang.lowercased(), meaning: meaning)
            
            
            slangDict.append(a)            
        }
        
//        for word in array {
//
//        }
    } catch {
        print(error)
    }
    
    print(slangDict[100])
}
