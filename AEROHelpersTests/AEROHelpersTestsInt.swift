//
//  AEROHelpersTestsInt.swift
//  AEROHelpersTests
//
//  Created by Stas on 21/08/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

@testable import AEROHelpers
import XCTest

class AEROHelpersTestsInt: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDefaultDeclensionsDays() {
        let variants = Int.DeclensionsVariants("день", "дня", "дней")
        
        // 1, 21, 51, 91
        for index in (1...91).filter({ ($0 % 10 == 1 && $0 != 11) }) {
            XCTAssertTrue(index.defaultsDeclensions.days == "день")
            XCTAssertTrue(index.defaultsDeclensions.days == index.declension(variants))
        }
        
        
        // 2, 43, 94
        for index in (0...100).filter({ (2...4 ~= $0 % 10) && 10 < $0 && $0 > 20 }) {
            XCTAssertTrue(index.defaultsDeclensions.days == "дня")
            XCTAssertTrue(index.defaultsDeclensions.days == index.declension(variants))
        }
        
        
        // 0, 10, 50, 90
        for index in stride(from: 0, to: 100, by: 10) {
            XCTAssertTrue(index.defaultsDeclensions.days == "дней")
            XCTAssertTrue(index.defaultsDeclensions.days == index.declension(variants))
        }
        
        // 6, 27, 58, 99
        for index in (0...100).filter({ (5...9 ~= $0 % 10) && 10 < $0 && $0 > 20 }) {
            XCTAssertTrue(index.defaultsDeclensions.days == "дней")
            XCTAssertTrue(index.defaultsDeclensions.days == index.declension(variants))
        }
        
        
        // 11, 12, 15, 19
        for index in 10...20 {
            XCTAssertTrue(index.defaultsDeclensions.days == "дней")
            XCTAssertTrue(index.defaultsDeclensions.days == index.declension(variants))
        }
    }
    
    
    func testDefaultDeclensionsSeconds() {
        let variants = Int.DeclensionsVariants("секунду", "секунды", "секунд")
        
        // 1, 21, 51, 91
        for index in (1...91).filter({ ($0 % 10 == 1 && $0 != 11) }) {
            XCTAssertTrue(index.defaultsDeclensions.seconds == "секунду")
            XCTAssertTrue(index.defaultsDeclensions.seconds == index.declension(variants))
        }
        
        
        // 2, 43, 94
        for index in (0...100).filter({ (2...4 ~= $0 % 10) && 10 < $0 && $0 > 20 }) {
            XCTAssertTrue(index.defaultsDeclensions.seconds == "секунды")
            XCTAssertTrue(index.defaultsDeclensions.seconds == index.declension(variants))
        }
        
        
        // 0, 10, 50, 90
        for index in stride(from: 0, to: 100, by: 10) {
            XCTAssertTrue(index.defaultsDeclensions.seconds == "секунд")
            XCTAssertTrue(index.defaultsDeclensions.seconds == index.declension(variants))
        }
        
        // 6, 27, 58, 99
        for index in (0...100).filter({ (5...9 ~= $0 % 10) && 10 < $0 && $0 > 20 }) {
            XCTAssertTrue(index.defaultsDeclensions.seconds == "секунд")
            XCTAssertTrue(index.defaultsDeclensions.seconds == index.declension(variants))
        }
        
        // 11, 12, 15, 19
        for index in 10...20 {
            XCTAssertTrue(index.defaultsDeclensions.seconds == "секунд")
            XCTAssertTrue(index.defaultsDeclensions.seconds == index.declension(variants))
        }
    }
    
    
    func testDefaultDeclensionsStones() {
        let variants = Int.DeclensionsVariants("камень", "камня", "камней")
        
        // 1, 21, 51, 91
        for index in (1...91).filter({ ($0 % 10 == 1 && $0 != 11) }) {
            XCTAssertTrue(index.defaultsDeclensions.stones == "камень")
            XCTAssertTrue(index.defaultsDeclensions.stones == index.declension(variants))
        }
        
        
        // 2, 43, 94
        for index in (0...100).filter({ (2...4 ~= $0 % 10) && 10 < $0 && $0 > 20 }) {
            XCTAssertTrue(index.defaultsDeclensions.stones == "камня")
            XCTAssertTrue(index.defaultsDeclensions.stones == index.declension(variants))
        }
        
        
        // 0, 10, 50, 90
        for index in stride(from: 0, to: 100, by: 10) {
            XCTAssertTrue(index.defaultsDeclensions.stones == "камней")
            XCTAssertTrue(index.defaultsDeclensions.stones == index.declension(variants))
        }
        
        // 6, 27, 58, 99
        for index in (0...100).filter({ (5...9 ~= $0 % 10) && 10 < $0 && $0 > 20 }) {
            XCTAssertTrue(index.defaultsDeclensions.stones == "камней")
            XCTAssertTrue(index.defaultsDeclensions.stones == index.declension(variants))
        }
        
        // 11, 12, 15, 19
        for index in 10...20 {
            XCTAssertTrue(index.defaultsDeclensions.stones == "камней")
            XCTAssertTrue(index.defaultsDeclensions.stones == index.declension(variants))
        }
    }
    
    
    func testDefaultDeclensionsProducts() {
        let variants = Int.DeclensionsVariants("изделие", "изделия", "изделий")
        
        // 1, 21, 51, 91
        for index in (1...91).filter({ ($0 % 10 == 1 && $0 != 11) }) {
            XCTAssertTrue(index.defaultsDeclensions.products == "изделие")
            XCTAssertTrue(index.defaultsDeclensions.products == index.declension(variants))
        }
        
        
        // 2, 43, 94
        for index in (0...100).filter({ (2...4 ~= $0 % 10) && 10 < $0 && $0 > 20 }) {
            XCTAssertTrue(index.defaultsDeclensions.products == "изделия")
            XCTAssertTrue(index.defaultsDeclensions.products == index.declension(variants))
        }
        
        
        // 0, 10, 50, 90
        for index in stride(from: 0, to: 100, by: 10) {
            XCTAssertTrue(index.defaultsDeclensions.products == "изделий")
            XCTAssertTrue(index.defaultsDeclensions.products == index.declension(variants))
        }
        
        // 6, 27, 58, 99
        for index in (0...100).filter({ (5...9 ~= $0 % 10) && 10 < $0 && $0 > 20 }) {
            XCTAssertTrue(index.defaultsDeclensions.products == "изделий")
            XCTAssertTrue(index.defaultsDeclensions.products == index.declension(variants))
        }
        
        // 11, 12, 15, 19
        for index in 10...20 {
            XCTAssertTrue(index.defaultsDeclensions.products == "изделий")
            XCTAssertTrue(index.defaultsDeclensions.products == index.declension(variants))
        }
    }
    
    
    func testDefaultDeclensionsGoods() {
        let variants = Int.DeclensionsVariants("товар", "товара", "товаров")
        
        // 1, 21, 51, 91
        for index in (1...91).filter({ ($0 % 10 == 1 && $0 != 11) }) {
            XCTAssertTrue(index.defaultsDeclensions.productsGoods == "товар")
            XCTAssertTrue(index.defaultsDeclensions.productsGoods == index.declension(variants))
        }
        
        
        // 2, 43, 94
        for index in (0...100).filter({ (2...4 ~= $0 % 10) && 10 < $0 && $0 > 20 }) {
            XCTAssertTrue(index.defaultsDeclensions.productsGoods == "товара")
            XCTAssertTrue(index.defaultsDeclensions.productsGoods == index.declension(variants))
        }
        
        
        // 0, 10, 50, 90
        for index in stride(from: 0, to: 100, by: 10) {
            XCTAssertTrue(index.defaultsDeclensions.productsGoods == "товаров")
            XCTAssertTrue(index.defaultsDeclensions.productsGoods == index.declension(variants))
        }
        
        // 6, 27, 58, 99
        for index in (0...100).filter({ (5...9 ~= $0 % 10) && 10 < $0 && $0 > 20 }) {
            XCTAssertTrue(index.defaultsDeclensions.productsGoods == "товаров")
            XCTAssertTrue(index.defaultsDeclensions.productsGoods == index.declension(variants))
        }
        
        // 11, 12, 15, 19
        for index in 10...20 {
            XCTAssertTrue(index.defaultsDeclensions.productsGoods == "товаров")
            XCTAssertTrue(index.defaultsDeclensions.productsGoods == index.declension(variants))
        }
    }
    
    
    func testDefaultDeclensionsItems() {
        let variants = Int.DeclensionsVariants("элемент", "элемента", "элементов")
        
        // 1, 21, 51, 91
        for index in (1...91).filter({ ($0 % 10 == 1 && $0 != 11) }) {
            XCTAssertTrue(index.defaultsDeclensions.items == "элемент")
            XCTAssertTrue(index.defaultsDeclensions.items == index.declension(variants))
        }
        
        
        // 2, 43, 94
        for index in (0...100).filter({ (2...4 ~= $0 % 10) && 10 < $0 && $0 > 20 }) {
            XCTAssertTrue(index.defaultsDeclensions.items == "элемента")
            XCTAssertTrue(index.defaultsDeclensions.items == index.declension(variants))
        }
        
        
        // 0, 10, 50, 90
        for index in stride(from: 0, to: 100, by: 10) {
            XCTAssertTrue(index.defaultsDeclensions.items == "элементов")
            XCTAssertTrue(index.defaultsDeclensions.items == index.declension(variants))
        }
        
        // 6, 27, 58, 99
        for index in (0...100).filter({ (5...9 ~= $0 % 10) && 10 < $0 && $0 > 20 }) {
            XCTAssertTrue(index.defaultsDeclensions.items == "элементов")
            XCTAssertTrue(index.defaultsDeclensions.items == index.declension(variants))
        }
        
        // 11, 12, 15, 19
        for index in 10...20 {
            XCTAssertTrue(index.defaultsDeclensions.items == "элементов")
            XCTAssertTrue(index.defaultsDeclensions.items == index.declension(variants))
        }
    }

}
