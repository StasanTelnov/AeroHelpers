//
//  AEROHelpersTestsVC.swift
//  AEROHelpersTests
//
//  Created by Stas on 21/08/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

@testable import AEROHelpers
import XCTest

private enum UIViewControllerConfig {
    static let validVcIdendtifier = "MockedViewController"
    static let invalidVcIdendtifier = "UIViewController"
}

private class MockedViewController: UIViewController, Identifiable { }


class AEROHelpersViewControllerTests: XCTestCase {
    
    // view controller
    private var identifiableVc: MockedViewController!
    private var identifiableVc2: UIViewController!
    private var nonIdentifiableVc: UIViewController!

    override func setUp() {
        identifiableVc = MockedViewController()
        identifiableVc2 = MockedViewController()
        nonIdentifiableVc = UIViewController()
    }

    override func tearDown() {
        identifiableVc = nil
        identifiableVc2 = nil
        nonIdentifiableVc = nil
    }

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

    
}
