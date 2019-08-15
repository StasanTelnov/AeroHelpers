//
//  StringProtocol+Currency.swift
//  AEROHelpers
//
//  Created by Stas on 23/05/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

import UIKit

// MARK: - protocol
/// Protocol for string and numbers, which shold support formating as currency
public protocol CurrencyFormatted {
    func currency(font: UIFont,
                  color: UIColor,
                  locale: Locale,
                  symbol: String,
                  prefix: String?,
                  postfix: String?,
                  count: Int?,
                  countFont: UIFont?,
                  countColor: UIColor?,
                  maxFraction: Int,
                  isStriked: Bool) -> NSAttributedString?
}


// MARK: - numbers helpers
extension Int: CurrencyFormatted {
    public func currency(font: UIFont,
                         color: UIColor,
                         locale: Locale = Locale.current,
                         symbol: String = .currencySymbol(),
                         prefix: String? = .none,
                         postfix: String? = .none,
                         count: Int? = .none,
                         countFont: UIFont? = .none,
                         countColor: UIColor? = .none,
                         maxFraction: Int = 0,
                         isStriked: Bool = false) -> NSAttributedString? {
        
        return String(self).currency(font: font,
                                     color: color,
                                     locale: locale,
                                     symbol: symbol,
                                     prefix: prefix,
                                     postfix: postfix,
                                     count: count,
                                     countFont: countFont,
                                     countColor: countColor,
                                     maxFraction: maxFraction,
                                     isStriked: isStriked)
    }
}

extension Float: CurrencyFormatted {
    public func currency(font: UIFont,
                         color: UIColor,
                         locale: Locale = Locale.current,
                         symbol: String = .currencySymbol(),
                         prefix: String? = .none,
                         postfix: String? = .none,
                         count: Int? = .none,
                         countFont: UIFont? = .none,
                         countColor: UIColor? = .none,
                         maxFraction: Int = 0,
                         isStriked: Bool = false) -> NSAttributedString? {
        
        return String(self).currency(font: font,
                                     color: color,
                                     locale: locale,
                                     symbol: symbol,
                                     prefix: prefix,
                                     postfix: postfix,
                                     count: count,
                                     countFont: countFont,
                                     countColor: countColor,
                                     maxFraction: maxFraction,
                                     isStriked: isStriked)
    }
}


// MARK: - main string helper
/// Extension for formating numbers in strings as currency
public extension StringProtocol {
    
    // MARK: - public methods
    /// Return currency symbol or empty string in specific locale
    static func currencySymbol(for localeIdentifier: String = "ru_RU") -> String {
        return Locale(identifier: localeIdentifier).currencySymbol ?? ""
    }

    /// Return formatted as cost attributed string from string
    func currency(font: UIFont,
                  color: UIColor,
                  locale: Locale = Locale.current,
                  symbol: String = .currencySymbol(),
                  prefix: String? = .none,
                  postfix: String? = .none,
                  count: Int? = .none,
                  countFont: UIFont? = .none,
                  countColor: UIColor? = .none,
                  maxFraction: Int = 0,
                  isStriked: Bool = false) -> NSAttributedString? {

        guard let string = formattedCurrency(font: font,
                                             color: color,
                                             locale: locale,
                                             symbol: symbol,
                                             prefix: prefix,
                                             postfix: postfix,
                                             maxFraction: maxFraction,
                                             isStriked: isStriked) else {
            return .none
        }

        guard let count = count,
            count > 1 else {
                return string.copy() as? NSAttributedString
        }

        let countFactorPrefix = countFactor(count, font: countFont ?? font, color: countColor ?? color)
        string.insert(countFactorPrefix, at: 0)

        return string.copy() as? NSAttributedString
    }
    
    // MARK: - internal methods
    private func formattedCurrency(font: UIFont,
                                   color: UIColor,
                                   locale: Locale = Locale.current,
                                   symbol: String = .currencySymbol(),
                                   prefix: String? = .none,
                                   postfix: String? = .none,
                                   maxFraction: Int = 0,
                                   isStriked: Bool = false) -> NSMutableAttributedString? {
        
        let digitsString = replacingOccurrences(of: "[^0-9-]", with: "", options: .regularExpression)
        
        guard let intConst = Int(digitsString) else {
                return .none
        }
        
        let price = NSNumber(value: intConst)
        
        let formatter = currencyFormatter(locale: locale, symbol: symbol, maxFraction: maxFraction)
        
        var currencyString = formatter.string(from: price) ?? "-"
        
        if let existPrefix = prefix {
            currencyString = existPrefix + currencyString
        }
        if let existPostfix = postfix {
            currencyString += existPostfix
        }
        
        var attibutes: [NSAttributedString.Key: Any] = [.foregroundColor: color, .font: font]
        if isStriked {
            attibutes[.strikethroughStyle] = NSUnderlineStyle.single.rawValue
        }
        
        let currencyFont = font
        let currencyAttributes: [NSAttributedString.Key: Any] = [.font: currencyFont]
        
        let attributedString = NSMutableAttributedString(string: currencyString, attributes: attibutes)
        attributedString.addAttributes(currencyAttributes, range: NSRange(location: currencyString.count - 1, length: 1))
        
        return attributedString
    }
    
    private func currencyFormatter(locale: Locale, symbol: String, maxFraction: Int) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .currency
        formatter.currencySymbol = symbol
        formatter.maximumFractionDigits = maxFraction
        
        return formatter
    }
    
    private func countFactor(_ count: Int, font: UIFont, color: UIColor) -> NSMutableAttributedString {
        let attibutes: [NSAttributedString.Key: Any] = [ .font: font, .foregroundColor: color]
        
        let countFactorString = String(count) + " x "
        
        let attributedCountFactorString = NSMutableAttributedString(string: countFactorString)
        let range = NSRange(location: 0, length: countFactorString.count)
        
        attributedCountFactorString.addAttributes(attibutes, range: range)
        
        return attributedCountFactorString
    }
}
