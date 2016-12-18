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
    func testExtractableValue() {
        typealias keys = CGSize.ExtractableKeys
        
        let rawData: [String: CGFloat] = [keys.width: 1,
                                          keys.height: 2]
        let data: [String: [String: CGFloat]] = ["size": rawData]
        let size: CGSize = try! data.value(for: "size")
        
        XCTAssertEqual(size.width, rawData[keys.width])
        XCTAssertEqual(size.height, rawData[keys.height])
    }
    
    func testIndexExtractableValue() {
        let rawData: [CGFloat] = [1, 2]
        let data: [[CGFloat]] = [rawData]
        let size: CGSize = try! data.value(for: 0)
        
        XCTAssertEqual(size.width, rawData[0])
        XCTAssertEqual(size.height, rawData[1])
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
        typealias keys = CGSize.ExtractableKeys
        
        let size = CGSize(width: 1, height: 2)
        let data: [String: CGFloat] = size.serialized()
        
        XCTAssertEqual(data[keys.width], size.width)
        XCTAssertEqual(data[keys.height], size.height)
    }
    
    func testIndexSerializable() {
        let size = CGSize(width: 1, height: 2)
        let data: [CGFloat] = size.serialized()
        
        XCTAssertEqual(data[0], size.width)
        XCTAssertEqual(data[1], size.height)
    }
}
