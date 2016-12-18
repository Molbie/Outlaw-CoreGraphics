//
//  CGLineCapTests.swift
//  OutlawCoreGraphics
//
//  Created by Brian Mullen on 12/17/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
import Outlaw
@testable import OutlawCoreGraphics


class CGLineCapTests: XCTestCase {
    func testStringInit() {
        typealias strings = CGLineCap.StringValues
        
        let butt = CGLineCap(stringValue: strings.butt)
        XCTAssertEqual(butt, .butt)
        
        let round = CGLineCap(stringValue: strings.round)
        XCTAssertEqual(round, .round)
        
        let square = CGLineCap(stringValue: strings.square)
        XCTAssertEqual(square, .square)
        
        let invalid = CGLineCap(stringValue: "invalid")
        XCTAssertNil(invalid)
    }
    
    func testUpperStringInit() {
        typealias strings = CGLineCap.StringValues
        
        let butt = CGLineCap(stringValue: strings.butt.uppercased())
        XCTAssertEqual(butt, .butt)
        
        let round = CGLineCap(stringValue: strings.round.uppercased())
        XCTAssertEqual(round, .round)
        
        let square = CGLineCap(stringValue: strings.square.uppercased())
        XCTAssertEqual(square, .square)
        
        let invalid = CGLineCap(stringValue: "INVALID")
        XCTAssertNil(invalid)
    }
    
    func testStringValue() {
        typealias strings = CGLineCap.StringValues
        
        let butt = CGLineCap.butt
        XCTAssertEqual(butt.stringValue, strings.butt)
        
        let round = CGLineCap.round
        XCTAssertEqual(round.stringValue, strings.round)
        
        let square = CGLineCap.square
        XCTAssertEqual(square.stringValue, strings.square)
    }
}
