//
//  AEROHelpersTests.swift
//  AEROHelpersTests
//
//  Created by Stas on 03/07/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

//swiftlint:disable file_length type_body_length force_unwrapping

@testable import AEROHelpers
import XCTest

// MARK: - configs
private enum Sizes {
    static let defaultRect = CGRect(x: 0, y: 0, width: 100, height: 100)
}

// MARK: view controller
private enum UIViewControllerConfig {
    static let validVcIdendtifier = "MockedViewController"
    static let invalidVcIdendtifier = "UIViewController"
}

// MARK: view
private enum UIViewConfig {
    static let validIdendtifier = "MockedView"
    static let invalidIdendtifier = "UIView"
}


// MARK: - mocks
private class MockedViewController: UIViewController, Identifiable { }
private class MockedView: UIView, ReuseIdentifiable { }


// MARK: -
class AEROHelpersTests: XCTestCase {
    // MARK: - variables
    // view controller
    private var identifiableVc: MockedViewController = MockedViewController()
    private var identifiableVc2: UIViewController = MockedViewController()
    private var nonIdentifiableVc: UIViewController = UIViewController()
    
    
    // view
    private var viewForLoadingIndicator: UIView = UIView(frame: Sizes.defaultRect)
    private var buttonForLoadingIndicator: UIButton = UIButton(frame: Sizes.defaultRect)
    private var labelForLoadingIndicator: UILabel = UILabel(frame: Sizes.defaultRect)
    
    private var identifiableView: MockedView = MockedView()
    private var identifiableView2: UIView = MockedView()
    private var nonIdentifiableView: UIView = UIView()

    // MARK: -
    override func setUp() { }

    override func tearDown() { }
    
    
    // MARK: -
    // MARK: - view controller tests
    func testUniqueVcId() {
        XCTAssertTrue(identifiableVc.identifier == UIViewControllerConfig.validVcIdendtifier)
        XCTAssertTrue(MockedViewController.identifier == UIViewControllerConfig.validVcIdendtifier)
        
        XCTAssertFalse(identifiableVc.identifier == UIViewControllerConfig.invalidVcIdendtifier)
        XCTAssertFalse(MockedViewController.identifier == UIViewControllerConfig.invalidVcIdendtifier)
        
        let identificable = identifiableVc2 as? Identifiable
        XCTAssertNotNil(identificable)
        
        XCTAssertTrue(identificable!.identifier == UIViewControllerConfig.validVcIdendtifier)
        
        let nonIdentificable = nonIdentifiableVc as? Identifiable
        XCTAssertNil(nonIdentificable)
    }
    
    
    // MARK: -
    // MARK: - UIView
    // MARK: loading indicator
    func testLoadingIndicatorView() {
        viewForLoadingIndicator.showLoading()
        
        var fogViewFound = false
        var fogBoundsCorrect = false
        var fogTagNotZero = false
        var indicatorViewFound = false
        viewForLoadingIndicator.subviews.forEach({
            if let fogView = $0 as? ReuseIdentifiable,
                fogView.reuseIdentifier == "LoadingView" {
                fogViewFound = true
                
                if fogView.bounds == viewForLoadingIndicator.bounds {
                    fogBoundsCorrect = true
                }
                
                if fogView.tag != 0 {
                    fogTagNotZero = true
                }
                
                $0.subviews.forEach({
                    if ($0 as? UIActivityIndicatorView) != nil {
                        indicatorViewFound = true
                    }
                })
            }
        })
        
        XCTAssertTrue(fogViewFound)
        XCTAssertTrue(fogBoundsCorrect)
        XCTAssertTrue(fogTagNotZero)
        XCTAssertTrue(indicatorViewFound)
        
        
        viewForLoadingIndicator.hideLoading()
        fogViewFound = false
        
        viewForLoadingIndicator.subviews.forEach({
            if $0.tag != 0 {
                fogViewFound = false
            }
        })
        
        XCTAssertFalse(fogViewFound)
    }
    
    func testLoadingIndicatorButton() {
        buttonForLoadingIndicator.showLoading()
        
        var fogViewFound = false
        var fogBoundsCorrect = false
        var fogTagNotZero = false
        var indicatorViewFound = false
        buttonForLoadingIndicator.subviews.forEach({
            if let fogView = $0 as? ReuseIdentifiable,
                fogView.reuseIdentifier == "LoadingView" {
                fogViewFound = true
                
                if fogView.bounds == buttonForLoadingIndicator.bounds {
                    fogBoundsCorrect = true
                }
                
                if fogView.tag != 0 {
                    fogTagNotZero = true
                }
                
                $0.subviews.forEach({
                    if ($0 as? UIActivityIndicatorView) != nil {
                        indicatorViewFound = true
                    }
                })
            }
        })
        
        XCTAssertTrue(fogViewFound)
        XCTAssertTrue(fogBoundsCorrect)
        XCTAssertTrue(fogTagNotZero)
        XCTAssertTrue(indicatorViewFound)
        
        
        buttonForLoadingIndicator.hideLoading()
        fogViewFound = false
        
        buttonForLoadingIndicator.subviews.forEach({
            if $0.tag != 0 {
                fogViewFound = false
            }
        })
        
        XCTAssertFalse(fogViewFound)
    }
    
    func testLoadingIndicatorLabel() {
        labelForLoadingIndicator.showLoading()
        
        var fogViewFound = false
        var fogBoundsCorrect = false
        var fogTagNotZero = false
        var indicatorViewFound = false
        labelForLoadingIndicator.subviews.forEach({
            if let fogView = $0 as? ReuseIdentifiable,
                fogView.reuseIdentifier == "LoadingView" {
                fogViewFound = true
                
                if fogView.bounds == labelForLoadingIndicator.bounds {
                    fogBoundsCorrect = true
                }
                
                if fogView.tag != 0 {
                    fogTagNotZero = true
                }
                
                $0.subviews.forEach({
                    if ($0 as? UIActivityIndicatorView) != nil {
                        indicatorViewFound = true
                    }
                })
            }
        })
        
        XCTAssertTrue(fogViewFound)
        XCTAssertTrue(fogBoundsCorrect)
        XCTAssertTrue(fogTagNotZero)
        XCTAssertTrue(indicatorViewFound)
        
        
        labelForLoadingIndicator.hideLoading()
        fogViewFound = false
        
        labelForLoadingIndicator.subviews.forEach({
            if $0.tag != 0 {
                fogViewFound = false
            }
        })
        
        XCTAssertFalse(fogViewFound)
    }
    
    // MARK: reused identifier
    func testReuseViewId() {
        XCTAssertTrue(identifiableView.reuseIdentifier == UIViewConfig.validIdendtifier)
        XCTAssertTrue(MockedView.reuseIdentifier == UIViewConfig.validIdendtifier)
        
        XCTAssertFalse(identifiableView.reuseIdentifier == UIViewConfig.invalidIdendtifier)
        XCTAssertFalse(MockedView.reuseIdentifier == UIViewConfig.invalidIdendtifier)
        
        let identificable = identifiableView2 as? ReuseIdentifiable
        XCTAssertNotNil(identificable)
        
        XCTAssertTrue(identificable!.reuseIdentifier == UIViewConfig.validIdendtifier)
        
        let nonIdentificable = nonIdentifiableView as? ReuseIdentifiable
        XCTAssertNil(nonIdentificable)
    }
    
    
    // MARK: -
    // MARK: - Int
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
    
    
    // MARK: -
    // MARK: - String
    // MARK: html
    func testHtmlDecode() {
        // some entities
        XCTAssertTrue("&quot;".htmlDecoded == "\"")
        XCTAssertTrue("&apos;".htmlDecoded == "'")
        XCTAssertTrue("&amp;".htmlDecoded == "&")
        XCTAssertTrue("&lt;".htmlDecoded == "<")
        XCTAssertTrue("&gt;".htmlDecoded == ">")
        
        // some tags
        XCTAssertTrue("<span>text</span>".htmlDecoded == "text")
        XCTAssertTrue("<p>paragraph</p>".htmlDecoded == "paragraph\n")
        XCTAssertTrue("<font>font</font>".htmlDecoded == "font")
        XCTAssertTrue("<bold>not boldered</bold>".htmlDecoded == "not boldered")
        XCTAssertTrue("<div>block</div>".htmlDecoded == "block\n")
        XCTAssertTrue("<img src='http://some.ru/img.png' />".htmlDecoded == "")
    }
    
    func testNl2Br() {
        XCTAssertTrue("\n".nl2br == "<br/>")
        XCTAssertTrue("\ntext\n".nl2br == "<br/>text<br/>")
        XCTAssertTrue("\n<br/>\n".nl2br == "<br/><br/><br/>")
    }
    
    // MARK: marked
    // MARK: currency
    // MARK: hex colors
    // MARK: remove characters

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
