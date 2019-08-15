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
private let kValidVcIdendtifier = "MockedViewController"
private let kInvalidVcIdendtifier = "UIViewController"
private let kInvalidVcIdendtifier2 = "OtherViewController"
class MockedViewController: UIViewController, Identifiable { }

private let kDefaultRect = CGRect(x: 0, y: 0, width: 100, height: 100)

// MARK: - tests
class AEROHelpersTests: XCTestCase {
    
    private var identifiableVc: MockedViewController!
    
    private var viewForLoadingIndicator: UIView!
    private var buttonForLoadingIndicator: UIButton!
    private var labelForLoadingIndicator: UILabel!

    override func setUp() {
        identifiableVc = MockedViewController()
        
        viewForLoadingIndicator = UIView(frame: kDefaultRect)
        buttonForLoadingIndicator = UIButton(frame: kDefaultRect)
        labelForLoadingIndicator = UILabel(frame: kDefaultRect)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        identifiableVc = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - view controller

    func testUniqueVcId() {
        XCTAssertTrue(identifiableVc.reuseIdentifier == kValidVcIdendtifier)
        XCTAssertTrue(MockedViewController.reuseIdentifier == kValidVcIdendtifier)
        
        XCTAssertFalse(identifiableVc.reuseIdentifier == kInvalidVcIdendtifier)
        XCTAssertFalse(MockedViewController.reuseIdentifier == kInvalidVcIdendtifier)
        
        XCTAssertFalse(identifiableVc.reuseIdentifier == kInvalidVcIdendtifier2)
        XCTAssertFalse(MockedViewController.reuseIdentifier == kInvalidVcIdendtifier2)
    }
    
    
    // MARK: - UIView
    // MARK: loading indicator
    func testLoadingIndicatorView() {
        
    }
    
    func testLoadingIndicatorButton() {
        
    }
    
    func testLoadingIndicatorLabel() {
        
    }
    
    // MARK: reused identifier
    
    
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
