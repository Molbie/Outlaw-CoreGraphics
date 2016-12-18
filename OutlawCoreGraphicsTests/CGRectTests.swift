//
//  CGRectTests.swift
//  OutlawCoreGraphics
//
//  Created by Brian Mullen on 12/17/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
import Outlaw
@testable import OutlawCoreGraphics


class CGRectTests: XCTestCase {
    func testExtractableValue() {
        typealias keys = CGRect.ExtractableKeys
        
        let rawData: [String: CGFloat] = [keys.x: 1,
                                          keys.y: 2,
                                          keys.width: 3,
                                          keys.height: 4]
        let data: [String: [String: CGFloat]] = ["rect": rawData]
        let rect: CGRect = try! data.value(for: "rect")
        
        XCTAssertEqual(rect.origin.x, rawData[keys.x])
        XCTAssertEqual(rect.origin.y, rawData[keys.y])
        XCTAssertEqual(rect.width, rawData[keys.width])
        XCTAssertEqual(rect.height, rawData[keys.height])
    }
    
    func testIndexExtractableValue() {
        let rawData: [CGFloat] = [1, 2, 3, 4]
        let data: [[CGFloat]] = [rawData]
        let rect: CGRect = try! data.value(for: 0)
        
        XCTAssertEqual(rect.origin.x, rawData[0])
        XCTAssertEqual(rect.origin.y, rawData[1])
        XCTAssertEqual(rect.width, rawData[2])
        XCTAssertEqual(rect.height, rawData[3])
    }
    
    func testInvalidValue() {
        let rawData: String = "Hello, Outlaw!"
        let data: [String] = [rawData]
        
        let ex = self.expectation(description: "Invalid data")
        do {
            let _: CGRect = try data.value(for: 0)
        }
        catch {
            if case OutlawError.typeMismatchWithIndex = error {
                ex.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSerializable() {
        typealias keys = CGRect.ExtractableKeys
        
        let rect = CGRect(x: 1, y: 2, width: 3, height: 4)
        let data: [String: CGFloat] = rect.serialized()
        
        XCTAssertEqual(data[keys.x], rect.origin.x)
        XCTAssertEqual(data[keys.y], rect.origin.y)
        XCTAssertEqual(data[keys.width], rect.width)
        XCTAssertEqual(data[keys.height], rect.height)
    }
    
    func testIndexSerializable() {
        let rect = CGRect(x: 1, y: 2, width: 3, height: 4)
        let data: [CGFloat] = rect.serialized()
        
        XCTAssertEqual(data[0], rect.origin.x)
        XCTAssertEqual(data[1], rect.origin.y)
        XCTAssertEqual(data[2], rect.width)
        XCTAssertEqual(data[3], rect.height)
    }
}
