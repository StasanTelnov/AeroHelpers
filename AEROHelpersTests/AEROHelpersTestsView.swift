//
//  AEROHelpersTestsView.swift
//  AEROHelpersTests
//
//  Created by Stas on 21/08/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

@testable import AEROHelpers
import XCTest


private enum Sizes {
    static let defaultRect = CGRect(x: 0, y: 0, width: 100, height: 100)
}


private enum UIViewConfig {
    static let validIdendtifier = "MockedView"
    static let invalidIdendtifier = "UIView"
}

private class MockedView: UIView, ReuseIdentifiable { }


class AEROHelpersTestsView: XCTestCase {
    
    // MARK: - variables
    // MARK: loading indicator
    private var viewForLoadingIndicator: UIView!
    private var buttonForLoadingIndicator: UIButton!
    private var labelForLoadingIndicator: UILabel!
    
    // MARK: reuse identifier
    private var identifiableView: MockedView!
    private var identifiableView2: UIView!
    private var nonIdentifiableView: UIView!

    
    // MARK: -
    override func setUp() {
        viewForLoadingIndicator = UIView(frame: Sizes.defaultRect)
        buttonForLoadingIndicator = UIButton(frame: Sizes.defaultRect)
        labelForLoadingIndicator = UILabel(frame: Sizes.defaultRect)
        
        identifiableView = MockedView()
        identifiableView2 = MockedView()
        nonIdentifiableView = UIView()
    }

    override func tearDown() {
        viewForLoadingIndicator = nil
        buttonForLoadingIndicator = nil
        labelForLoadingIndicator = nil

        identifiableView = nil
        identifiableView2 = nil
        nonIdentifiableView = nil
    }

    
    // MARK: - loading indicator tests
    // MARK: internal
    private func showLoadingTesting<T: UIView>(_ view: T) {
        view.showLoading()
        
        let indicatorView = view.subviews.first(where: { ($0 as? ReuseIdentifiable)?.reuseIdentifier == "LoadingView" })
        XCTAssertNotNil(indicatorView)
        XCTAssertTrue(indicatorView?.bounds == view.bounds)
    }
    
    private func isLoadingShowed<T: UIView>(_ view: T) {
        view.showLoading()
        XCTAssertTrue(view.isLoadingProgress)
    }
    
    private func hideLoadingTesting<T: UIView>(_ view: T) {
        view.showLoading()
        view.hideLoading()
        
        let indicatorView = view.subviews.first(where: { ($0 as? ReuseIdentifiable)?.reuseIdentifier == "LoadingView" })
        XCTAssertNil(indicatorView)
    }
    
    // MARK: indicator on view
    func testLoadingIndicatorView() {
        showLoadingTesting(viewForLoadingIndicator)
    }
    
    func testLoadingIndicatorViewProgress() {
        isLoadingShowed(viewForLoadingIndicator)
    }
    
    func testLoadingIndicatorViewHide() {
        hideLoadingTesting(viewForLoadingIndicator)
    }
    
    func testLOadIndicatorAppearance() {
        let fogColor: UIColor = .black
        let indicatorStyle: UIActivityIndicatorView.Style = .whiteLarge
        let indicatorColor: UIColor = .red
        
        LoadingIndicator.appearance().fogColor = fogColor
        LoadingIndicator.appearance().indicatorStyle = indicatorStyle
        LoadingIndicator.appearance().indicatorColor = indicatorColor
        
        viewForLoadingIndicator.showLoading()
        
        let indicatorView = viewForLoadingIndicator.subviews.first(where: { ($0 as? ReuseIdentifiable)?.reuseIdentifier == "LoadingView" })
        XCTAssertTrue(indicatorView?.backgroundColor == fogColor)
        
        let indicator = indicatorView?.subviews.first(where: { ($0 as? UIActivityIndicatorView) != nil }) as? UIActivityIndicatorView
        XCTAssertTrue(indicator?.style == indicatorStyle)
        XCTAssertTrue(indicator?.color == indicatorColor)
    }
    
    
    // MARK: indicator on button
    func testLoadingIndicatorButton() {
        showLoadingTesting(buttonForLoadingIndicator)
    }
    
    func testLoadingIndicatorProgress() {
        isLoadingShowed(buttonForLoadingIndicator)
    }
    
    func testLoadingIndicatorButtonHide() {
        hideLoadingTesting(viewForLoadingIndicator)
    }
    
    
    // MARK: indicator on label
    func testLoadingIndicatorLabel() {
        showLoadingTesting(labelForLoadingIndicator)
    }
    
    func testLoadingIndicatorLabelProgress() {
        isLoadingShowed(labelForLoadingIndicator)
    }
    
    func testLoadingIndicatorLabelHide() {
        hideLoadingTesting(viewForLoadingIndicator)
    }
    
    
    // MARK: - reused identifier
    func testReuseViewIdOnSpecificClass() {
        XCTAssertTrue(identifiableView.reuseIdentifier == UIViewConfig.validIdendtifier)
        XCTAssertTrue(MockedView.reuseIdentifier == UIViewConfig.validIdendtifier)
        
        XCTAssertFalse(identifiableView.reuseIdentifier == UIViewConfig.invalidIdendtifier)
        XCTAssertFalse(MockedView.reuseIdentifier == UIViewConfig.invalidIdendtifier)

    }
    
    func testReuseViewIdOnImplicitlyClass() {
        let identificable = identifiableView2 as? ReuseIdentifiable
        XCTAssertNotNil(identificable)
        XCTAssertTrue(identificable?.reuseIdentifier == UIViewConfig.validIdendtifier)
        
        let objType = type(of: identificable!)
        XCTAssertTrue(objType.reuseIdentifier == UIViewConfig.validIdendtifier)
    }
    
    func testReuseViewIdOnNotIdentificableClass() {
        let nonIdentificable = nonIdentifiableView as? ReuseIdentifiable
        XCTAssertNil(nonIdentificable)
    }
    
    // MARK: - xib loadable
    // coming soon

}
