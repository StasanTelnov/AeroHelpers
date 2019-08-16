//
//  Int+Declension.swift
//  AEROHelpers
//
//  Created by Stas on 23/05/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

import Foundation

//TODO: should refactoring, other structs

/// Declension strings by its count
public extension Int {
    
    // MARK: - declensions variants struct
    /// Variants of declension
    /// - Parameters:
    ///     - oneVariant: variant, when remainder of division from count of items to 10 is 1 (1 день, 21 день, 1361 день).
    ///     - mediumVariant: variant, when remainder of division from count of items to 10 between 2 and 4 (2 дня, 24 дня, 1363 дня).
    ///     - othersVariants: variant, when remainder of division from count of items to 100 is between 5 and 20 or remainder of division to 10 not equal to oneVariant or mediumVariant (10 дней, 111 дней, 14 дней)
    struct DeclensionsVariants<T> {
        var oneVariant: T
        var mediumVariant: T
        var othersVariants: T
        
        public init(_ one: T, _ medium: T, _ others: T) {
            oneVariant = one
            mediumVariant = medium
            othersVariants = others
        }
        
        /// Return declensioned object via remainder of division or number of items
        subscript(number: Int) -> T {
            
            let remainderOfDivision = number % 100
            if 5...20 ~= remainderOfDivision {
                return othersVariants
            }
            
            switch number % 10 {
                
            case 1: //remainder of division
                return oneVariant
                
            case 2...4:
                return mediumVariant
                
            default:
                return othersVariants
            }
        }
    }
    
    // MARK: - default declinsions collection
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
    
    
    // MARK: - declension
    /// Declense items to current integer
    /// - Parameters:
    ///   - variants: DeclensionsVariants object, which containt 3 decletions string items
    func declension(_ variants: DeclensionsVariants<String>) -> String {
        if 11...19 ~= self   {
            return variants[self]
        }
        return variants[self % 10]
    }
    
}
