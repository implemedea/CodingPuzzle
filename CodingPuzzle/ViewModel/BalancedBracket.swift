//
//  BalancedBracket.swift
//  CodingPuzzle
//
//  Created by Sebastin on 11/07/19.
//  Copyright © 2019 Sebastin. All rights reserved.
//

import Foundation

class BalancedBracket {
    func checkBalancedBracket(bracket: String) -> String {
        var squareBracketCount = 0
        var curlyBracketCount = 0
        var roundBracketCount = 0
        var angleBracketCount = 0
        let characters = Array(bracket)
        for (_, item) in characters.enumerated(){
            if item == "{" {
                curlyBracketCount += 1
            } else if item == "}" {
                curlyBracketCount -= 1
            }
            if item == "[" {
                squareBracketCount += 1
            } else if item == "]" {
                squareBracketCount -= 1
            }
            if item == "(" {
                roundBracketCount += 1
            } else if item == ")" {
                roundBracketCount -= 1
            }
            if item == "<" {
                angleBracketCount += 1
            } else if item == ">" {
                angleBracketCount -= 1
            }
        }
        if curlyBracketCount == 0 && squareBracketCount == 0 && roundBracketCount == 0 && angleBracketCount == 0 {
            return "This is balanced Square bracket"
        }
        return "This is not balanced Square bracket"
    }
}
