//
//  String+Html.swift
//  AEROHelpers
//
//  Created by Stas on 23/05/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

import Foundation

public protocol HtmlString {
    var html: NSAttributedString? { get }
    var decoded: String { get }
    var nl2br: String { get }
    var br2nl: String { get }
}


/// for processing with strings, which contain html elements or entities
extension String: HtmlString {
    
    /// try convert html string to NSAttributedString
    public var html: NSAttributedString? {
        guard let data = data(using: .utf8) else {
            return .none
        }
        
        do {
            let attributedString = try NSAttributedString(data: data,
                                                          options: [
                                                            .documentType: NSAttributedString.DocumentType.html,
                                                            .characterEncoding: Encoding.utf8.rawValue],
                                                          documentAttributes: .none)
            return attributedString
        } catch {
            return .none
        }
    }
    
    /// try decode html string via attributed string
    public var decoded: String {
        let decoded = html?.string
        
        return decoded ?? self
    }
    
    /// remove \r symbols and replace \n symbols to <br/> html tag
    public var nl2br: String {
        var cleaneString = replacingOccurrences(of: "\r", with: "")
        cleaneString = cleaneString.replacingOccurrences(of: "\n\n", with: "<br/>")
        return cleaneString.replacingOccurrences(of: "\n", with: "<br/>")
    }
    
    /// replace <br/> html tag to \n symbols
    public var br2nl: String {
        var replacedString = replacingOccurrences(of: "<br>", with: "\n")
        replacedString = replacedString.replacingOccurrences(of: "(<br */?>)", with: "\n")
        return replacedString.replacingOccurrences(of: "(<br*/?>)", with: "\n")
    }
}
