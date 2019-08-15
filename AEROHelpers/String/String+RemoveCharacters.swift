//
//  String+RemoveCharacters.swift
//  AEROHelpers
//
//  Created by Stas on 23/05/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

import Foundation

/// extension for processing with characters in string
public extension String {
    
    /// remove string characters from string
    func removeCharacters(from: String) -> String {
        return removeCharacters(CharacterSet(charactersIn: from))
    }
    
    private func removeCharacters(_ forbiddenChars: CharacterSet) -> String {
        let passed = unicodeScalars.filter { !forbiddenChars.contains($0) }
        return String(String.UnicodeScalarView(passed))
    }
}
