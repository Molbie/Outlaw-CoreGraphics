//
//  CGLineJoinTests.swift
//  OutlawCoreGraphics
//
//  Created by Brian Mullen on 12/17/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
import Outlaw
@testable import OutlawCoreGraphics


class CGLineJoinTests: XCTestCase {
    func testStringInit() {
        let miter = CGLineJoin(stringValue: "miter")
        XCTAssertEqual(miter, .miter)
        
        let round = CGLineJoin(stringValue: "round")
        XCTAssertEqual(round, .round)
        
        let bevel = CGLineJoin(stringValue: "bevel")
        XCTAssertEqual(bevel, .bevel)
        
        let invalid = CGLineJoin(stringValue: "invalid")
        XCTAssertNil(invalid)
    }
    
    func testUpperStringInit() {
        let miter = CGLineJoin(stringValue: "MITER")
        XCTAssertEqual(miter, .miter)
        
        let round = CGLineJoin(stringValue: "ROUND")
        XCTAssertEqual(round, .round)
        
        let bevel = CGLineJoin(stringValue: "BEVEL")
        XCTAssertEqual(bevel, .bevel)
        
        let invalid = CGLineJoin(stringValue: "INVALID")
        XCTAssertNil(invalid)
    }
    
    func testStringValue() {
        let miter = CGLineJoin.miter
        XCTAssertEqual(miter.stringValue, "miter")
        
        let round = CGLineJoin.round
        XCTAssertEqual(round.stringValue, "round")
        
        let bevel = CGLineJoin.bevel
        XCTAssertEqual(bevel.stringValue, "bevel")
    }
}
