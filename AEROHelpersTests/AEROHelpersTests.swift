//
//  AEROHelpersTests.swift
//  AEROHelpersTests
//
//  Created by Stas on 03/07/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

@testable import AEROHelpers
import XCTest

// MARK: - configs
private enum Sizes {
    static let defaultRect = CGRect(x: 0, y: 0, width: 100, height: 100)
}

private enum UIViewControllerConfig {
    static let validVcIdendtifier = "MockedViewController"
    static let invalidVcIdendtifier = "UIViewController"
}

private enum UIViewConfig {
    static let validIdendtifier = "MockedView"
    static let invalidIdendtifier = "UIView"
}


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
        
        let nonIdentificable = nonIdentifiableView as? Identifiable
        XCTAssertNil(nonIdentificable)
    }
    
    
    // MARK: - String
    
    // MARK: hex colors
    // MARK: declension
    // MARK: html
    // MARK: marked
    // MARK: remove characters
    // MARK: roubled

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
