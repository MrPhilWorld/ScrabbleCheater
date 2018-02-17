//
//  Scrabble+Extensions.swift
//  Scrabble Cheater
//
//  Created by Phil Lafrance on 2018-02-16.
//  Copyright © 2018 Phil Lafrance. All rights reserved.
//

import Foundation

extension CharacterSet
{
    static let scrabble: CharacterSet = CharacterSet.init(charactersIn: "abcdefghijklmnopqrstuvwxyz*")
}

extension Character
{
    func isValid() -> Bool
    {
        let char: Character = String(self).lowercased().first!
        return CharacterSet.scrabble.contains(char.unicodeScalars.first!)
    }
}
