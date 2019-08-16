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
    func markSubstrings(_ markedSubstrings: [String],
                        mainFont: UIFont = .systemFont(ofSize: UIFont.systemFontSize),
                        mainColor: UIColor = .darkText,
                        markFont: UIFont = .systemFont(ofSize: UIFont.systemFontSize),
                        markColor: UIColor = .blue,
                        onlyFirst: Bool = false) -> NSAttributedString? {
        
        let infoText = simpleAttributedString(font: mainFont, color: mainColor)
        
        // TODO: nested loop, should refactor it
        markedSubstrings.forEach {
            ranges(of: $0, onlyFirst: onlyFirst).forEach { infoRange in
                let nsInfoRange = NSRange(infoRange, in: self)
                infoText.addAttributes([.foregroundColor: markColor], range: nsInfoRange)
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
    
    private func ranges(of string: String, onlyFirst: Bool = false) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var indexValue = startIndex
        while indexValue < endIndex,
            let range = self[indexValue...].range(of: string) {
                result.append(range)
                if onlyFirst {
                    return result
                }
                indexValue = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
