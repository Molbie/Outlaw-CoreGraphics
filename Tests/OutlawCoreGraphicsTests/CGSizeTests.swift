//
//  CGSizeTests.swift
//  OutlawCoreGraphics
//
//  Created by Brian Mullen on 12/17/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
import Outlaw
@testable import OutlawCoreGraphics


class CGSizeTests: XCTestCase {
    static var allTests = [("testExtractableValue", testExtractableValue),
                           ("testIndexExtractableValue", testIndexExtractableValue),
                           ("testInvalidValue", testInvalidValue),
                           ("testSerializable", testSerializable),
                           ("testIndexSerializable", testIndexSerializable)]
    
    private typealias keys = CGSize.ExtractableKeys
    private typealias indexes = CGSize.ExtractableIndexes
    
    func testExtractableValue() {
        let rawData: [String: CGFloat] = [keys.width: 1,
                                          keys.height: 2]
        let data: [String: [String: CGFloat]] = ["size": rawData]
        let size: CGSize = try! data.value(for: "size")
        
        XCTAssertEqual(size.width, rawData[keys.width])
        XCTAssertEqual(size.height, rawData[keys.height])
    }
    
    func testIndexExtractableValue() {
        var rawData = [CGFloat](repeating: 0, count: 2)
        rawData[indexes.width] = 1
        rawData[indexes.height] = 2
        
        let data: [[CGFloat]] = [rawData]
        let size: CGSize = try! data.value(for: 0)
        
        XCTAssertEqual(size.width, rawData[indexes.width])
        XCTAssertEqual(size.height, rawData[indexes.height])
    }
    
    func testInvalidValue() {
        let rawData: String = "Hello, Outlaw!"
        let data: [String] = [rawData]
        
        let ex = self.expectation(description: "Invalid data")
        do {
            let _: CGSize = try data.value(for: 0)
        }
        catch {
            if case OutlawError.typeMismatchWithIndex = error {
                ex.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSerializable() {
        let size = CGSize(width: 1, height: 2)
        let data = size.serialized()
        
        XCTAssertEqual(data[keys.width], size.width)
        XCTAssertEqual(data[keys.height], size.height)
    }
    
    func testIndexSerializable() {
        let size = CGSize(width: 1, height: 2)
        let data = size.serializedIndexes()
        
        XCTAssertEqual(data[indexes.width], size.width)
        XCTAssertEqual(data[indexes.height], size.height)
    }
}
