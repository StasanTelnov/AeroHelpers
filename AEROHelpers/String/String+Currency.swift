//
//  String+Currency.swift
//  AEROHelpers
//
//  Created by Stas on 23/05/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

import UIKit

//swiftlint:disable function_parameter_count

/// Appearance format for currency
public class CurrencyFormat: UILabel {
    
    /// Font of cost string. Default is system font with system size.
    @objc public dynamic var mainFont: UIFont?
    
    /// Color of cost string. Default is dark text color.
    @objc public dynamic var mainColor: UIColor?
    
    /// Locale by rules of which cost string will formatted. Default is current locale.
    @objc public dynamic var locale: Locale?
    
    /// Currency symbol. Gets from currencySymbol method of CurrencyFormatted protocol. Default return symbol for ru_RU locale (russian ruble).
    @objc public dynamic var symbol: String?
    
    /// String, which comes before cost. Default is nil.
    @objc public dynamic var prefix: String?
    
    /// String, which comes after cost. Default is nil.
    @objc public dynamic var postfix: String?
    
    /// ont of count substring. Default is nil and equal to mainFont.
    @objc public dynamic var countFont: UIFont?
    
    /// Color of count substring. Default is nil and equal to mainColor.
    @objc public dynamic var countColor: UIColor?
    
    /// Minimum of digits in fraction. Default is zero.
    @objc public dynamic var minFraction: Int = 0
    
    /// Maximum of digits in fraction. Default is zero.
    @objc public dynamic var maxFraction: Int = 0
    
}

// MARK: - protocol
/// Protocol for string and numbers, which shold support formating as currency
public protocol CurrencyFormatted {
    
    /// Should return formatted attributted string
    /// - Parameters:
    ///   - mainFont: Font by default currency string. Default is system font with system size.
    ///   - mainColor: Color by default currency string. Defailt is dark text.
    ///   - locale: Locale by rules of which cost string will formatted. Default is current locale.
    ///   - symbol: Currency symbol. Gets from currencySymbol method of CurrencyFormatted protocol. Default return symbol for ru_RU locale (russian ruble).
    ///   - prefix: String, which comes before cost. Default is nil.
    ///   - postfix: String, which comes after cost. Default is nil.
    ///   - count: Number of items count. Default is nil. If more that 1, that befor cost inserted substring "\(count) X ...".
    ///   - countFont: Font of count substring. Default is nil and equal to mainFont.
    ///   - countColor: Color of count substring. Default is nil and equal to mainColor.
    ///   - minFraction: Minimum of digits in fraction. Default is zero.
    ///   - maxFraction: Maximum of digits in fraction. Default is zero.
    ///   - isStriked: If true, that cost string will striked. Defaults is false.
    func currency(mainFont: UIFont,
                  mainColor: UIColor,
                  locale: Locale,
                  symbol: String,
                  prefix: String?,
                  postfix: String?,
                  count: Int?,
                  countFont: UIFont?,
                  countColor: UIColor?,
                  minFraction: Int,
                  maxFraction: Int,
                  isStriked: Bool) -> NSAttributedString?
    
    func currencyString(locale: Locale,
                        symbol: String,
                        prefix: String?,
                        postfix: String?,
                        minFraction: Int,
                        maxFraction: Int) -> String
}

extension CurrencyFormatted {
    /// Return currency symbol or empty string in specific locale
    public static func currencySymbol(for localeIdentifier: String = "ru_RU") -> String {
        return Locale(identifier: localeIdentifier).currencySymbol ?? ""
    }
}

// MARK: - numbers helpers
//TODO: bad solution. Should refactor on generics maybe
extension Int: CurrencyFormatted {
    public func currency(mainFont: UIFont = CurrencyFormat.appearance().mainFont ?? .systemFont(ofSize: UIFont.systemFontSize),
                         mainColor: UIColor = CurrencyFormat.appearance().mainColor ?? .darkText,
                         locale: Locale = CurrencyFormat.appearance().locale ?? Locale.current,
                         symbol: String = CurrencyFormat.appearance().symbol ?? .currencySymbol(),
                         prefix: String? = CurrencyFormat.appearance().prefix,
                         postfix: String? = CurrencyFormat.appearance().postfix,
                         count: Int? = .none,
                         countFont: UIFont? = CurrencyFormat.appearance().countFont,
                         countColor: UIColor? = CurrencyFormat.appearance().countColor,
                         minFraction: Int = CurrencyFormat.appearance().minFraction,
                         maxFraction: Int = CurrencyFormat.appearance().maxFraction,
                         isStriked: Bool = false) -> NSAttributedString? {
        
        return String(self).currency(mainFont: mainFont,
                                     mainColor: mainColor,
                                     locale: locale,
                                     symbol: symbol,
                                     prefix: prefix,
                                     postfix: postfix,
                                     count: count,
                                     countFont: countFont,
                                     countColor: countColor,
                                     minFraction: minFraction,
                                     maxFraction: maxFraction,
                                     isStriked: isStriked)
    }
    
    public func currencyString(locale: Locale = CurrencyFormat.appearance().locale ?? Locale.current,
                               symbol: String = CurrencyFormat.appearance().symbol ?? .currencySymbol(),
                               prefix: String? = CurrencyFormat.appearance().prefix,
                               postfix: String? = CurrencyFormat.appearance().postfix,
                               minFraction: Int = CurrencyFormat.appearance().minFraction,
                               maxFraction: Int = CurrencyFormat.appearance().maxFraction) -> String {
        
        return String(self).currencyString(locale: locale,
                                           symbol: symbol,
                                           prefix: prefix,
                                           postfix: postfix,
                                           minFraction: minFraction,
                                           maxFraction: maxFraction)
    }
}

extension Float: CurrencyFormatted {
    public func currency(mainFont: UIFont = CurrencyFormat.appearance().mainFont ?? .systemFont(ofSize: UIFont.systemFontSize),
                         mainColor: UIColor = CurrencyFormat.appearance().mainColor ?? .darkText,
                         locale: Locale = CurrencyFormat.appearance().locale ?? Locale.current,
                         symbol: String = CurrencyFormat.appearance().symbol ?? .currencySymbol(),
                         prefix: String? = CurrencyFormat.appearance().prefix,
                         postfix: String? = CurrencyFormat.appearance().postfix,
                         count: Int? = .none,
                         countFont: UIFont? = CurrencyFormat.appearance().countFont,
                         countColor: UIColor? = CurrencyFormat.appearance().countColor,
                         minFraction: Int = CurrencyFormat.appearance().minFraction,
                         maxFraction: Int = CurrencyFormat.appearance().maxFraction,
                         isStriked: Bool = false) -> NSAttributedString? {
        
        return String(self).currency(mainFont: mainFont,
                                     mainColor: mainColor,
                                     locale: locale,
                                     symbol: symbol,
                                     prefix: prefix,
                                     postfix: postfix,
                                     count: count,
                                     countFont: countFont,
                                     countColor: countColor,
                                     minFraction: minFraction,
                                     maxFraction: maxFraction,
                                     isStriked: isStriked)
    }
    
    public func currencyString(locale: Locale = CurrencyFormat.appearance().locale ?? Locale.current,
                               symbol: String = CurrencyFormat.appearance().symbol ?? .currencySymbol(),
                               prefix: String? = CurrencyFormat.appearance().prefix,
                               postfix: String? = CurrencyFormat.appearance().postfix,
                               minFraction: Int = CurrencyFormat.appearance().minFraction,
                               maxFraction: Int = CurrencyFormat.appearance().maxFraction) -> String {
        
        return String(self).currencyString(locale: locale,
                                           symbol: symbol,
                                           prefix: prefix,
                                           postfix: postfix,
                                           minFraction: minFraction,
                                           maxFraction: maxFraction)
    }
}

extension Double: CurrencyFormatted {
    public func currency(mainFont: UIFont = CurrencyFormat.appearance().mainFont ?? .systemFont(ofSize: UIFont.systemFontSize),
                         mainColor: UIColor = CurrencyFormat.appearance().mainColor ?? .darkText,
                         locale: Locale = CurrencyFormat.appearance().locale ?? Locale.current,
                         symbol: String = CurrencyFormat.appearance().symbol ?? .currencySymbol(),
                         prefix: String? = CurrencyFormat.appearance().prefix,
                         postfix: String? = CurrencyFormat.appearance().postfix,
                         count: Int? = .none,
                         countFont: UIFont? = CurrencyFormat.appearance().countFont,
                         countColor: UIColor? = CurrencyFormat.appearance().countColor,
                         minFraction: Int = CurrencyFormat.appearance().minFraction,
                         maxFraction: Int = CurrencyFormat.appearance().maxFraction,
                         isStriked: Bool = false) -> NSAttributedString? {
        
        return String(self).currency(mainFont: mainFont,
                                     mainColor: mainColor,
                                     locale: locale,
                                     symbol: symbol,
                                     prefix: prefix,
                                     postfix: postfix,
                                     count: count,
                                     countFont: countFont,
                                     countColor: countColor,
                                     minFraction: minFraction,
                                     maxFraction: maxFraction,
                                     isStriked: isStriked)
    }
    
    public func currencyString(locale: Locale = CurrencyFormat.appearance().locale ?? Locale.current,
                               symbol: String = CurrencyFormat.appearance().symbol ?? .currencySymbol(),
                               prefix: String? = CurrencyFormat.appearance().prefix,
                               postfix: String? = CurrencyFormat.appearance().postfix,
                               minFraction: Int = CurrencyFormat.appearance().minFraction,
                               maxFraction: Int = CurrencyFormat.appearance().maxFraction) -> String {
        
        return String(self).currencyString(locale: locale,
                                           symbol: symbol,
                                           prefix: prefix,
                                           postfix: postfix,
                                           minFraction: minFraction,
                                           maxFraction: maxFraction)
    }
}



// MARK: - main string helper
/// Extension for formating numbers in strings as currency
extension String: CurrencyFormatted {
    
    // MARK: - public methods
    
    /// Return formatted as cost attributed string from string
    public func currency(mainFont: UIFont = CurrencyFormat.appearance().mainFont ?? .systemFont(ofSize: UIFont.systemFontSize),
                         mainColor: UIColor = CurrencyFormat.appearance().mainColor ?? .darkText,
                         locale: Locale = CurrencyFormat.appearance().locale ?? Locale.current,
                         symbol: String = CurrencyFormat.appearance().symbol ?? .currencySymbol(),
                         prefix: String? = CurrencyFormat.appearance().prefix,
                         postfix: String? = CurrencyFormat.appearance().postfix,
                         count: Int? = .none,
                         countFont: UIFont? = CurrencyFormat.appearance().countFont,
                         countColor: UIColor? = CurrencyFormat.appearance().countColor,
                         minFraction: Int = CurrencyFormat.appearance().minFraction,
                         maxFraction: Int = CurrencyFormat.appearance().maxFraction,
                         isStriked: Bool = false) -> NSAttributedString? {
        
        guard let string = formattedCurrency(font: mainFont,
                                             color: mainColor,
                                             locale: locale,
                                             symbol: symbol,
                                             prefix: prefix,
                                             postfix: postfix,
                                             minFraction: minFraction,
                                             maxFraction: maxFraction,
                                             isStriked: isStriked) else {
                                                return .none
        }
        
        guard let count = count,
            count > 1 else {
                return string.copy() as? NSAttributedString
        }
        
        let countFactorPrefix = countFactor(count, font: countFont ?? mainFont, color: countColor ?? mainColor)
        string.insert(countFactorPrefix, at: 0)
        
        return string.copy() as? NSAttributedString
    }
    
    public func currencyString(locale: Locale = Locale.current,
                        symbol: String = .currencySymbol(),
                        prefix: String? = .none,
                        postfix: String? = .none,
                        minFraction: Int = 0,
                        maxFraction: Int = 0) -> String {
        
        guard let price = cleanToNumber() else {
            return self
        }
        let formatter = currencyFormatter(locale: locale, symbol: symbol, minFraction: minFraction, maxFraction: maxFraction)
        
        var currencyString = formatter.string(from: price) ?? self
        
        if let existPrefix = prefix {
            currencyString = existPrefix + currencyString
        }
        if let existPostfix = postfix {
            currencyString += existPostfix
        }
        
        return currencyString
    }
    
    // MARK: - internal methods
    private func formattedCurrency(font: UIFont,
                                   color: UIColor,
                                   locale: Locale = Locale.current,
                                   symbol: String = .currencySymbol(),
                                   prefix: String? = .none,
                                   postfix: String? = .none,
                                   minFraction: Int = 0,
                                   maxFraction: Int = 0,
                                   isStriked: Bool = false) -> NSMutableAttributedString? {

        guard let price = cleanToNumber() else {
            return .none
        }
        
        let formatter = currencyFormatter(locale: locale, symbol: symbol, minFraction: minFraction, maxFraction: maxFraction)
        
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
    
    private func currencyFormatter(locale: Locale, symbol: String, minFraction: Int, maxFraction: Int) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .currency
        formatter.currencySymbol = symbol
        formatter.minimumFractionDigits = maxFraction
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
    
    private func cleanToNumber() -> NSNumber? {
        var digitsString = replacingOccurrences(of: ",", with: ".", options: .literal)
        
        guard digitsString.firstIndex(of: ".") == digitsString.lastIndex(of: ".") else {
            print("Dont can parse string to number: many dots.")
            return .none
        }
        
        digitsString = replacingOccurrences(of: "[^.0-9-]", with: "", options: .regularExpression)
        
        guard let intConst = Float(digitsString) else {
            return .none
        }
        return NSNumber(value: intConst)
    }
}

//swiftlint:enable function_parameter_count
