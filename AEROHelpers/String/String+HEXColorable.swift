//
//  String+HEXColorable.swift
//  AEROHelpers
//
//  Created by Stas on 23/05/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

import UIKit

/// Protocol for string, which should conform HEX string color format
public protocol ColoredString {
    
    /// Check, that this string is HEX color string
    var isHexColor: Bool { get }
    
    /// Generate UIColor from string, if it possible
    var color: UIColor? { get }
}

/// Realization of ColoredString protocol
extension String: ColoredString {
    
    /// Check, that is HEX color string
    public var isHexColor: Bool {
        var testIsColor = self
        
        if testIsColor.hasPrefix("#") {
            testIsColor.remove(at: testIsColor.startIndex)
        }
        
        guard Int(testIsColor, radix: 16) != nil,
            (testIsColor.count == 6 || testIsColor.count == 3) else {
            return false
        }
        
        return true
    }
    
    /// Return optional UIColor, if string is HEX color
    public var color: UIColor? {
        guard isHexColor else {
            return nil
        }
        var hexString = self
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count == 3 {
            let tmpString = hexString
            tmpString.forEach({
                guard let index = hexString.firstIndex(of: $0) else {
                    return
                }
                hexString.insert($0, at: index)
            })
        }

        var rgbValue: UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255,
            blue: CGFloat(rgbValue & 0x0000FF) / 255,
            alpha: CGFloat(1.0)
        )
    }
}
