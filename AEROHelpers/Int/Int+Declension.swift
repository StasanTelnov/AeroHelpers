//
//  Int+Declension.swift
//  AEROHelpers
//
//  Created by Stas on 23/05/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

import Foundation

/// Variants of declension
/// - Parameters:
///     - oneVariant: variant, when items number is one (1 день, 21 день, 1361 день).
///     - mediumVariant: variant, when items number between 2 and 4 (2 дня, 24 дня, 1363 дня).
///     - othersVariants: variant, when items number is: zero, over 4, between 11 and 19 (0 дней, 16 дней, 1369 дней).
public struct DeclensionsVariants<T> {
    var oneVariant: T
    var mediumVariant: T
    var othersVariants: T
    
    public init(_ one: T, _ medium: T, _ others: T) {
        oneVariant = one
        mediumVariant = medium
        othersVariants = others
    }
    
    subscript(index: Int) -> T {
        switch index {
        case 1:
            return oneVariant
        case 2...4:
            return mediumVariant
        case 0,
             5...9,
             11...19:
            return othersVariants
            
        default:
            fatalError("Incorrect range of variants")
        }
    }
}


/// Declension strings by its count
public extension Int {
    
    /// Predefined declinsions
    struct Declensions {
        var currentNumber: Int
        
        init(_ number: Int) {
            currentNumber = number
        }
        
        /// Predefined days variants
        public var days: String {
            let variants = DeclensionsVariants("день", "дня", "дней")
            return currentNumber.declension(variants)
        }
        
        /// Predefined seconds variants
        public var seconds: String {
            let variants = DeclensionsVariants("секунду", "секунды", "секунд")
            return currentNumber.declension(variants)
        }
        
        /// Predefined stones variants
        public var stones: String {
            let variants = DeclensionsVariants("камень", "камня", "камней")
            return currentNumber.declension(variants)
        }
        
        /// Predefined products variants
        public var products: String {
            let variants = DeclensionsVariants("изделие", "изделия", "изделий")
            return currentNumber.declension(variants)
        }
        
        /// Predefined productsGoods variants
        public var productsGoods: String {
            let variants = DeclensionsVariants("товар", "товара", "товаров")
            return currentNumber.declension(variants)
        }
        
        /// Predefined items variants
        public var items: String {
            let variants = DeclensionsVariants("элемент", "элемента", "элементов")
            return currentNumber.declension(variants)
        }
    }
    
    /// Return predefined variants
    var defaultsDeclensions: Declensions {
        return Declensions(self)
    }
    
    /// Declense items to current integer
    func declension(_ variants: DeclensionsVariants<String>) -> String {
        if 11...19 ~= self   {
            return variants[self]
        }
        return variants[self % 10]
    }
    
}
