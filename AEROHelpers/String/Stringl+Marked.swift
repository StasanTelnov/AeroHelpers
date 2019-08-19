//
//  String+Marked.swift
//  AEROHelpers
//
//  Created by Stas Telnov on 22.11.2018.
//  Copyright © 2018 AERO. All rights reserved.
//

import UIKit

/// Extension for marked substrings with other font/color
public extension String {
    
    /// Return attributed string with marked some substrings
    /// - Parameters:
    ///   - markedSubstrings: List of substrings, which you need marking
    ///   - mainFont: Text font. Optional, by default system font with system font size
    ///   - mainColor: Not-marked text color. Optional, by default is dart text color.
    ///   - markFont: Text font. Optional, by default equal to mainFont
    ///   - markColor: Marked substrings color. Optinal, by default is blue color
    ///   - isOnlyFirst: If true, that all founded substrings will marked, if false, that only first founded. Optional, by default is false
    func markSubstrings(_ markedSubstrings: [String],
                        mainFont: UIFont = .systemFont(ofSize: UIFont.systemFontSize),
                        mainColor: UIColor = .darkText,
                        markFont: UIFont = .systemFont(ofSize: UIFont.systemFontSize),
                        markColor: UIColor = .blue,
                        isOnlyFirst: Bool = false) -> NSAttributedString? {
        
        let infoText = simpleAttributedString(font: mainFont, color: mainColor)
        
        // TODO: nested loop, should refactor it
        markedSubstrings.forEach {
            ranges(of: $0, isOnlyFirst: isOnlyFirst).forEach { infoRange in
                let nsInfoRange = NSRange(infoRange, in: self)
                infoText.addAttributes([.font: markFont, .foregroundColor: markColor], range: nsInfoRange)
            }
        }
        return infoText.copy() as? NSAttributedString
    }
    
    
    // MARK: internal methods
    private func simpleAttributedString(font: UIFont, color: UIColor) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: self,
                                         attributes: [
                                            .font: font,
                                            .foregroundColor: color
            ])
    }
    
    private func ranges(of string: String, isOnlyFirst: Bool = false) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var indexValue = startIndex
        
        while indexValue < endIndex,
            let range = self[indexValue...].range(of: string) {
                result.append(range)
                
                if isOnlyFirst {
                    return result
                }
                
                let endIndexValue = index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
                indexValue = range.lowerBound < range.upperBound ? range.upperBound : endIndexValue
                
        }
        
        return result
    }
}
