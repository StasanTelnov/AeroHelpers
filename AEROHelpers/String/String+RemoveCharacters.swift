//
//  String+RemoveCharacters.swift
//  AEROHelpers
//
//  Created by Stas on 23/05/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

import Foundation

/// Helper for removing characters from string
public extension String {
    
    /// Remove string characters from string
    func removeCharacters(_ list: String, ignoreCase: Bool = false) -> String {
        return removeCharacters(CharacterSet(charactersIn: list), ignoreCase: ignoreCase)
    }
    
    
    private func removeCharacters(_ forbiddenChars: CharacterSet, ignoreCase: Bool) -> String {
        let passed = unicodeScalars.filter {
            var isNotExists = !forbiddenChars.contains($0)
            if isNotExists,
                ignoreCase {
                let symbol = String($0)
                let uppered = symbol.uppercased()
                let checkSymbol = symbol == uppered ? uppered.lowercased() : uppered
                
                if let scalar = checkSymbol.unicodeScalars.first {
                    isNotExists = !forbiddenChars.contains(scalar)
                }
                
            }
            
            return isNotExists
        }
        return String(String.UnicodeScalarView(passed))
    }
}
