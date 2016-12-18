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
        typealias strings = CGLineJoin.StringValues
        
        let miter = CGLineJoin(stringValue: strings.miter)
        XCTAssertEqual(miter, .miter)
        
        let round = CGLineJoin(stringValue: strings.round)
        XCTAssertEqual(round, .round)
        
        let bevel = CGLineJoin(stringValue: strings.bevel)
        XCTAssertEqual(bevel, .bevel)
        
        let invalid = CGLineJoin(stringValue: "invalid")
        XCTAssertNil(invalid)
    }
    
    func testUpperStringInit() {
        typealias strings = CGLineJoin.StringValues
        
        let miter = CGLineJoin(stringValue: strings.miter.uppercased())
        XCTAssertEqual(miter, .miter)
        
        let round = CGLineJoin(stringValue: strings.round.uppercased())
        XCTAssertEqual(round, .round)
        
        let bevel = CGLineJoin(stringValue: strings.bevel.uppercased())
        XCTAssertEqual(bevel, .bevel)
        
        let invalid = CGLineJoin(stringValue: "INVALID")
        XCTAssertNil(invalid)
    }
    
    func testStringValue() {
        typealias strings = CGLineJoin.StringValues
        
        let miter = CGLineJoin.miter
        XCTAssertEqual(miter.stringValue, strings.miter)
        
        let round = CGLineJoin.round
        XCTAssertEqual(round.stringValue, strings.round)
        
        let bevel = CGLineJoin.bevel
        XCTAssertEqual(bevel.stringValue, strings.bevel)
    }
}
