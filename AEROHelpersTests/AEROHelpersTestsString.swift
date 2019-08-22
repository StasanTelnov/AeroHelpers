//
//  AEROHelpersTestsString.swift
//  AEROHelpersTests
//
//  Created by Stas on 21/08/2019.
//  Copyright © 2019 AERO. All rights reserved.
//

@testable import AEROHelpers
import XCTest

// MARK: - test enums
// MARK: html
private enum DecodeTest { // (htmlString, expectedResult)
    enum Entities {
        static var quot = ("&quot;", "\"")
        static var apos = ("&apos;", "'")
        static var amp = ("&amp;", "&")
        static var leftBracket = ("&lt;", "<")
        static var rightBracket = ("&gt;", ">")
    }
    
    enum HtmlTags {
        static var span = ("<span>text</span>", "text")
        static var paragraph = ("<p>paragraph</p>", "paragraph\n")
        static var font = ("<font style=\"font-family: 'Arial'; font-size: 24pt; color: #ffaa66;\">font</font>", "font")
        static var bold = ("<bold>not boldered</bold>", "not boldered")
        static var div = ("<div>block</div>", "block\n")
        static var img = ("<img src='http://some.ru/img.png' /> some text", "some text")
        
        static var longHtmlText: String {
            var testStr = ""
            for _ in 1...100 {
                testStr += self.span.0 + " <br/> "
                testStr += self.paragraph.0 + " <br/> "
                testStr += self.font.0 + " <br/> "
                testStr += self.bold.0 + " <br/> "
                testStr += self.div.0 + " <br/> "
                testStr += self.img.0 + " <br/> "
            }
            return testStr
        }
    }
}


private enum NlAndBrConverts {
    enum Nls {
        static var one = ("\n", "<br/>")
        static var text = ("\ntext\n", "<br/>text<br/>")
        static var withBr = ("\n<br/>\n", "<br/><br/><br/>")
    }
    enum Brs {
        static var simple = ("123 <br> 321", "123 \n 321")
        static var closed = ("123 <br/> 321", "123 \n 321")
        static var spaceBeforeClose = ("123 <br /> 321", "123 \n 321")
        static var spaceAfterClose = ("123 <br/ > 321", "123 \n 321")
        static var specesBetweenClose = ("123 <br / > 321", "123 \n 321")
    }
}


// MARK: marked
private enum MarkedString {
    static var containtMarking = ("Test string with test for testing marking", ["test"])
    static var notContaintMarking = ("Test string with test for testing marking", ["some substring"])
    
    static var longMarkingString: String {
        var testStr = ""
        for _ in 1...100 {
            testStr += self.containtMarking.0 + ". "
        }
        return testStr
    }
}


// MARK: - currency
private enum CostsValues {
    static var intCost: Int = 1_123
    static var floatCost: Float = 1_234
    static var doubleCost: Double = 1_234
    
    static var stringCost = "1234"
    static var stringCostWithSpaceAndMinus = "- 1 234"
    static var stringCostWithDot = "1 234.24"
    static var stringCostWithComma = "1 234,24"
    static var stringCostWithText = "cost is 1 234. rubles and 24 kopecks"
    static var stringCostBad = "cost is 1 234. rubles, and 24 kopecks"
}


// MARK: hex colors
private enum HEXColors {
    static var color = "#FF8ba4"
    static var colorWithoutOctothorpe = "83bAf4"
    
    static var shortColor = "#47F"
    static var shortColorWithoutOctothorpe = "8A3"
}


// MARK: characters
private enum RemoveCharacters {
    static var aCharWithCase = ("String with some \"A\" characters", "String with some \"\" chrcters")
    static var aCharWithoutCase = ("String with some \"A\" characters", "String with some \"A\" chrcters")
    
    static var asCharWithCase = ("String with some \"A\" and \"S\" characters", "tring with ome \"\" nd \"\" chrcter")
    static var asCharWithoutCase = ("String with some \"A\" and \"S\" characters", "String with ome \"A\" nd \"S\" chrcter")
}


// MARK: -
// MARK: - tests
class AEROHelpersTestsString: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - html
    func testHtmlDecodeEntities() {
        // some entities
        XCTAssertTrue(DecodeTest.Entities.quot.0.htmlDecoded == DecodeTest.Entities.quot.1)
        XCTAssertTrue(DecodeTest.Entities.apos.0.htmlDecoded == DecodeTest.Entities.apos.1)
        XCTAssertTrue(DecodeTest.Entities.amp.0.htmlDecoded == DecodeTest.Entities.amp.1)
        XCTAssertTrue(DecodeTest.Entities.leftBracket.0.htmlDecoded == DecodeTest.Entities.leftBracket.1)
        XCTAssertTrue(DecodeTest.Entities.rightBracket.0.htmlDecoded == DecodeTest.Entities.rightBracket.1)
    }
    
    func testHtmlDecodeHtml() {
        XCTAssertTrue(DecodeTest.HtmlTags.span.0.htmlDecoded == DecodeTest.HtmlTags.span.1)
        XCTAssertTrue(DecodeTest.HtmlTags.paragraph.0.htmlDecoded == DecodeTest.HtmlTags.paragraph.1)
        XCTAssertTrue(DecodeTest.HtmlTags.font.0.htmlDecoded == DecodeTest.HtmlTags.font.1)
        XCTAssertTrue(DecodeTest.HtmlTags.bold.0.htmlDecoded == DecodeTest.HtmlTags.bold.1)
        XCTAssertTrue(DecodeTest.HtmlTags.div.0.htmlDecoded == DecodeTest.HtmlTags.div.1)
        XCTAssertTrue(DecodeTest.HtmlTags.img.0.htmlDecoded == DecodeTest.HtmlTags.img.1)
    }
    
    func testNl2Br() {
        XCTAssertTrue(NlAndBrConverts.Nls.one.0.nl2br == NlAndBrConverts.Nls.one.1)
        XCTAssertTrue(NlAndBrConverts.Nls.text.0.nl2br == NlAndBrConverts.Nls.text.1)
        XCTAssertTrue(NlAndBrConverts.Nls.withBr.0.nl2br == NlAndBrConverts.Nls.withBr.1)
    }
    
    func testBr2Nl() {
        XCTAssertTrue(NlAndBrConverts.Brs.simple.0.br2nl == NlAndBrConverts.Brs.simple.1)
        XCTAssertTrue(NlAndBrConverts.Brs.closed.0.br2nl == NlAndBrConverts.Brs.closed.1)
        XCTAssertTrue(NlAndBrConverts.Brs.spaceBeforeClose.0.br2nl == NlAndBrConverts.Brs.spaceBeforeClose.1)
        XCTAssertTrue(NlAndBrConverts.Brs.spaceAfterClose.0.br2nl == NlAndBrConverts.Brs.spaceAfterClose.1)
        XCTAssertTrue(NlAndBrConverts.Brs.specesBetweenClose.0.br2nl == NlAndBrConverts.Brs.specesBetweenClose.1)
    }
    
    
    // MARK: - currency
    //TODO: checking corrent attributes in result
    func testCurrency() {
        let defaultFont = UIFont.systemFont(ofSize: 18)
        let defaultColor = UIColor.black
        
        XCTAssertNotNil(CostsValues.intCost.currency(mainFont: defaultFont, mainColor: defaultColor))
        XCTAssertNotNil(CostsValues.floatCost.currency(mainFont: defaultFont, mainColor: defaultColor, maxFraction: 2))
        XCTAssertNotNil(CostsValues.doubleCost.currency(mainFont: defaultFont, mainColor: defaultColor, locale: Locale(identifier: "de_DE"), maxFraction: 2))
        XCTAssertNotNil(CostsValues.stringCost.currency(mainFont: defaultFont, mainColor: defaultColor, locale: Locale(identifier: "de_DE"), prefix: "prefix - ", postfix: " - postfix", maxFraction: 2))
        XCTAssertNotNil(CostsValues.stringCostWithSpaceAndMinus.currency(mainFont: defaultFont, mainColor: defaultColor, locale: Locale(identifier: "de_DE"), prefix: "prefix - ", postfix: " - postfix", maxFraction: 2))
        XCTAssertNotNil(CostsValues.stringCostWithDot.currency(mainFont: defaultFont, mainColor: defaultColor, locale: Locale(identifier: "de_DE"), symbol: "¥", prefix: "prefix - ", postfix: " - postfix", maxFraction: 2))
        XCTAssertNotNil(CostsValues.stringCostWithComma.currency(mainFont: defaultFont, mainColor: defaultColor, locale: Locale(identifier: "de_DE"), symbol: "¥", prefix: "prefix - ", postfix: " - postfix", maxFraction: 2, isStriked: true))
        XCTAssertNotNil(CostsValues.stringCostWithText.currency(mainFont: defaultFont, mainColor: defaultColor, locale: Locale(identifier: "de_DE"), symbol: "¥", prefix: "prefix - ", postfix: " - postfix", count: 5, countFont: .boldSystemFont(ofSize: 20), countColor: .red, maxFraction: 2, isStriked: true))
        
        XCTAssertNil(CostsValues.stringCostBad.currency(mainFont: defaultFont, mainColor: defaultColor))
    }
    
    
    // MARK: - marked
    //TODO: checking corrent attributes in result
    func testMarked() {
        XCTAssertNotNil(MarkedString.containtMarking.0.markSubstrings(MarkedString.containtMarking.1))
        XCTAssertNotNil(MarkedString.containtMarking.0.markSubstrings(MarkedString.containtMarking.1, mainFont: .boldSystemFont(ofSize: 20)))
        XCTAssertNotNil(MarkedString.containtMarking.0.markSubstrings(MarkedString.containtMarking.1, mainFont: .boldSystemFont(ofSize: 20), mainColor: .red))
        XCTAssertNotNil(MarkedString.containtMarking.0.markSubstrings(MarkedString.containtMarking.1, mainFont: .boldSystemFont(ofSize: 20), mainColor: .red, markFont: .boldSystemFont(ofSize: 18)))
        XCTAssertNotNil(MarkedString.containtMarking.0.markSubstrings(MarkedString.containtMarking.1, mainFont: .boldSystemFont(ofSize: 20), mainColor: .red, markFont: .boldSystemFont(ofSize: 18), markColor: .brown))
        XCTAssertNotNil(MarkedString.containtMarking.0.markSubstrings(MarkedString.containtMarking.1, mainFont: .boldSystemFont(ofSize: 20), mainColor: .red, markFont: .boldSystemFont(ofSize: 18), markColor: .brown, isOnlyFirst: false))
        
        XCTAssertNotNil(MarkedString.notContaintMarking.0.markSubstrings(MarkedString.notContaintMarking.1))
        XCTAssertNotNil(MarkedString.notContaintMarking.0.markSubstrings(MarkedString.notContaintMarking.1, mainFont: .boldSystemFont(ofSize: 20)))
        XCTAssertNotNil(MarkedString.notContaintMarking.0.markSubstrings(MarkedString.notContaintMarking.1, mainFont: .boldSystemFont(ofSize: 20), mainColor: .red))
        XCTAssertNotNil(MarkedString.notContaintMarking.0.markSubstrings(MarkedString.notContaintMarking.1, mainFont: .boldSystemFont(ofSize: 20), mainColor: .red, markFont: .boldSystemFont(ofSize: 18)))
        XCTAssertNotNil(MarkedString.notContaintMarking.0.markSubstrings(MarkedString.notContaintMarking.1, mainFont: .boldSystemFont(ofSize: 20), mainColor: .red, markFont: .boldSystemFont(ofSize: 18), markColor: .brown))
        XCTAssertNotNil(MarkedString.notContaintMarking.0.markSubstrings(MarkedString.notContaintMarking.1, mainFont: .boldSystemFont(ofSize: 20), mainColor: .red, markFont: .boldSystemFont(ofSize: 18), markColor: .brown, isOnlyFirst: false))
    }

    // MARK: - hex string color tests
    func testStringIsHexColor() {
        XCTAssertTrue(HEXColors.color.isHexColor)
        XCTAssertTrue(HEXColors.colorWithoutOctothorpe.isHexColor)
        XCTAssertTrue(HEXColors.shortColor.isHexColor)
        XCTAssertTrue(HEXColors.shortColorWithoutOctothorpe.isHexColor)
    }
    
    func testStringHexColor() {
        XCTAssertNotNil(HEXColors.color.color)
        XCTAssertNotNil(HEXColors.colorWithoutOctothorpe.color)
        XCTAssertNotNil(HEXColors.shortColor.color)
        XCTAssertNotNil(HEXColors.shortColorWithoutOctothorpe.color)
    }
    
    
    // MARK: - remove characters
    func testRemoveCharacters() {
        XCTAssertTrue(RemoveCharacters.aCharWithCase.0.removeCharacters("a", ignoreCase: true) == RemoveCharacters.aCharWithCase.1)
        XCTAssertTrue(RemoveCharacters.aCharWithoutCase.0.removeCharacters("a") == RemoveCharacters.aCharWithoutCase.1)
        
        XCTAssertTrue(RemoveCharacters.asCharWithCase.0.removeCharacters("as", ignoreCase: true) == RemoveCharacters.asCharWithCase.1)
        XCTAssertTrue(RemoveCharacters.asCharWithoutCase.0.removeCharacters("as") == RemoveCharacters.asCharWithoutCase.1)
    }
    
    // MARK: - performance
    func testPerformanceDecode() {
        let string = DecodeTest.HtmlTags.longHtmlText
        self.measure {
            string.htmlDecoded
        }
    }
    
    func testPerformanceMarked() {
        let string = MarkedString.longMarkingString
        self.measure {
            string.markSubstrings(["test"], mainFont: .boldSystemFont(ofSize: 20), mainColor: .red, markFont: .boldSystemFont(ofSize: 18), markColor: .brown, isOnlyFirst: false)
        }
    }
    
    func testPerformanceСurrency() {
        self.measure {
            CostsValues.stringCostWithText.currency(mainFont: .systemFont(ofSize: 18), mainColor: .black, locale: Locale(identifier: "de_DE"), symbol: "¥", prefix: "prefix - ", postfix: " - postfix", count: 5, countFont: .boldSystemFont(ofSize: 20), countColor: .red, maxFraction: 2, isStriked: true)
        }
    }

}
