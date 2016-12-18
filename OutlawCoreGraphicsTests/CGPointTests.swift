//
//  CGPointTests.swift
//  OutlawCoreGraphics
//
//  Created by Brian Mullen on 12/17/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
import Outlaw
@testable import OutlawCoreGraphics


class CGPointTests: XCTestCase {
    func testExtractableValue() {
        typealias keys = CGPoint.ExtractableKeys
        
        let rawData: [String: CGFloat] = [keys.x: 1,
                                          keys.y: 2]
        let data: [String: [String: CGFloat]] = ["point": rawData]
        let point: CGPoint = try! data.value(for: "point")
        
        XCTAssertEqual(point.x, rawData[keys.x])
        XCTAssertEqual(point.y, rawData[keys.y])
    }
    
    func testIndexExtractableValue() {
        let rawData: [CGFloat] = [1, 2]
        let data: [[CGFloat]] = [rawData]
        let point: CGPoint = try! data.value(for: 0)
        
        XCTAssertEqual(point.x, rawData[0])
        XCTAssertEqual(point.y, rawData[1])
    }
    
    func testInvalidValue() {
        let rawData: String = "Hello, Outlaw!"
        let data: [String] = [rawData]
        
        let ex = self.expectation(description: "Invalid data")
        do {
            let _: CGPoint = try data.value(for: 0)
        }
        catch {
            if case OutlawError.typeMismatchWithIndex = error {
                ex.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSerializable() {
        typealias keys = CGPoint.ExtractableKeys
        
        let point = CGPoint(x: 1, y: 2)
        let data: [String: CGFloat] = point.serialized()
        
        XCTAssertEqual(data[keys.x], point.x)
        XCTAssertEqual(data[keys.y], point.y)
    }
    
    func testIndexSerializable() {
        let point = CGPoint(x: 1, y: 2)
        let data: [CGFloat] = point.serialized()
        
        XCTAssertEqual(data[0], point.x)
        XCTAssertEqual(data[1], point.y)
    }
}
