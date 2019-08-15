//
//  Int+Declension.swift
//  AEROHelpers
//
//  Created by Stas on 23/05/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

import Foundation

/// Declension strings by its count
public extension Int {
    
    /// Prepared declinsions
    enum Declensions {
        static func days(_ days: Int) -> String {
            return days.declension(["дня", "дней", "дней"])
        }
        
        static func seconds(_ seconds: Int) -> String {
            return seconds.declension(["секунду", "секунды", "секунд"])
        }
        
        static func stones(_ stones: Int) -> String {
            return stones.declension(["камень", "камня", "камней"])
        }
        
        static func products(_ products: Int) -> String {
            return products.declension(["изделие", "изделия", "изделий"])
        }
        
        static func productsGoods(_ products: Int) -> String {
            return products.declension(["товар", "товара", "товаров"])
        }
        
        static func items(_ items: Int) -> String {
            return items.declension(["элемент", "элемента", "элементов"])
        }
    }
    
    
    /// Declense items to current integer
    func declension(_ variants: [String]) -> String {
        guard variants.count == 3 else {
            fatalError("Number of variants should equal to 3")
        }
        var str = ""
        
        if self >= 11,
            self <= 19 {
            str = variants[2]
        } else {
            let i = self % 10
            
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
