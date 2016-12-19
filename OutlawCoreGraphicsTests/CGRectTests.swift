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
        typealias indexes = CGRect.ExtractableIndexes
        
        var rawData = [CGFloat](repeating: 0, count: 4)
        rawData[indexes.x] = 1
        rawData[indexes.y] = 2
        rawData[indexes.width] = 3
        rawData[indexes.height] = 4
        
        let data: [[CGFloat]] = [rawData]
        let rect: CGRect = try! data.value(for: 0)
        
        XCTAssertEqual(rect.origin.x, rawData[indexes.x])
        XCTAssertEqual(rect.origin.y, rawData[indexes.y])
        XCTAssertEqual(rect.width, rawData[indexes.width])
        XCTAssertEqual(rect.height, rawData[indexes.height])
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
        typealias indexes = CGRect.ExtractableIndexes
        
        let rect = CGRect(x: 1, y: 2, width: 3, height: 4)
        let data: [CGFloat] = rect.serialized()
        
        XCTAssertEqual(data[indexes.x], rect.origin.x)
        XCTAssertEqual(data[indexes.y], rect.origin.y)
        XCTAssertEqual(data[indexes.width], rect.width)
        XCTAssertEqual(data[indexes.height], rect.height)
    }
}
