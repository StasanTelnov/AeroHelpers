//
//  String+Html.swift
//  AEROHelpers
//
//  Created by Stas on 23/05/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

import Foundation

/// Protocol for String, which can contain html
public protocol HtmlString {
    
    /// Generate attributes string from string with html
    var html: NSAttributedString? { get }
    
    /// Remove html from string, convert html string to simple string without tags
    var decoded: String? { get }
    
    /// Covert \n symbols to <br/> tags and remove \r symbols
    var nl2br: String { get }
    
    /// Covert <br/> tags to \n symbols
    var br2nl: String { get }
}


/// for processing with strings, which contain html elements or entities
extension String: HtmlString {
    
    /// Try convert html string to NSAttributedString with equal to exists tags attributes
    public var html: NSAttributedString? {
        guard let data = data(using: .utf8) else {
            return .none
        }
        
        do {
            let attributedString = try NSAttributedString(data: data,
                                                          options: [
                                                            .documentType: NSAttributedString.DocumentType.html,
                                                            .characterEncoding: String.Encoding.utf8.rawValue],
                                                          documentAttributes: .none)
            return attributedString
        } catch {
            return .none
        }
    }
    
    /// Remove html from string, convert html string to simple string without tags
    public var decoded: String? {
        return html?.string
    }
    
    /// Covert \n symbols to <br/> tags and remove \r symbols
    public var nl2br: String {
        let cleaneString = replacingOccurrences(of: "\r", with: "")
        return cleaneString.replacingOccurrences(of: "\n", with: "<br/>")
    }
    
    ///Covert <br/> tags to \n symbols
    public var br2nl: String {
        var replacedString = replacingOccurrences(of: "<br>", with: "\n")
        replacedString = replacedString.replacingOccurrences(of: "(<br */?>)", with: "\n")
        return replacedString.replacingOccurrences(of: "(<br*/?>)", with: "\n")
    }
}
