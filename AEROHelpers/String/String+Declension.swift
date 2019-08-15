//
//  String+Declension.swift
//  AEROHelpers
//
//  Created by Stas on 23/05/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

import Foundation

/// extension for declension strings for its count
public extension String {
    
    /// prepared declinsions
    enum Declensions {
        static func daysNameFor(_ days: Int) -> String {
            return declension(days, ["дня", "дней", "дней"])
        }
        
        static func seconds(_ seconds: Int) -> String {
            return declension(seconds, ["секунду", "секунды", "секунд"])
        }
        
        static func stones(_ stones: Int) -> String {
            return declension(stones, ["камень", "камня", "камней"])
        }
        
        static func products(_ products: Int) -> String {
            return declension(products, ["изделие", "изделия", "изделий"])
        }
        
        static func productsGoods(_ products: Int) -> String {
            return declension(products, ["товар", "товара", "товаров"])
        }
        
        static func items(_ items: Int) -> String {
            return declension(items, ["элемент", "элемента", "элементов"])
        }
    }
    
    
    /// MARK: declense items to specific number of item
    static func declension(_ number: Int, _ variants: [String]) -> String {
        guard variants.count == 3 else {
            fatalError("Number of variants should equal to 3")
        }
        var str = ""
        
        if number >= 11,
            number <= 19 {
            str = variants[2]
        } else {
            let i = number % 10
            
            switch i {
            case 1: str = variants[0]
                
            case 2, 3, 4:
                str = variants[1]
                
            default:
                str = variants[2]
                
            }
        }
        
        return str
    }
    
}
