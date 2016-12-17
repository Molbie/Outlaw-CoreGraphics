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
        let butt = CGLineCap(stringValue: "butt")
        XCTAssertEqual(butt, .butt)
        
        let round = CGLineCap(stringValue: "round")
        XCTAssertEqual(round, .round)
        
        let square = CGLineCap(stringValue: "square")
        XCTAssertEqual(square, .square)
        
        let invalid = CGLineCap(stringValue: "invalid")
        XCTAssertNil(invalid)
    }
    
    func testUpperStringInit() {
        let butt = CGLineCap(stringValue: "BUTT")
        XCTAssertEqual(butt, .butt)
        
        let round = CGLineCap(stringValue: "ROUND")
        XCTAssertEqual(round, .round)
        
        let square = CGLineCap(stringValue: "SQUARE")
        XCTAssertEqual(square, .square)
        
        let invalid = CGLineCap(stringValue: "INVALID")
        XCTAssertNil(invalid)
    }
    
    func testStringValue() {
        let butt = CGLineCap.butt
        XCTAssertEqual(butt.stringValue, "butt")
        
        let round = CGLineCap.round
        XCTAssertEqual(round.stringValue, "round")
        
        let square = CGLineCap.square
        XCTAssertEqual(square.stringValue, "square")
    }
}
