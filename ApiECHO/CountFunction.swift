//
//  CountFunction.swift
//  ApiECHO
//
//  Created by Vitalii Havryliuk on 9/14/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import Foundation

func countCharacters(text: String) -> [Character : Int] {
    var data: [Character : Int] = [:]
    let characters = Array(text)
    for character in characters {
        if data.keys.contains(character) {
            let oldValue = data[character]
            data.updateValue(oldValue! + 1, forKey: character)
        } else {
            data.updateValue(1, forKey: character)
        }
    }
    return data
}
