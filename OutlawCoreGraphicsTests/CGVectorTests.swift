//
//  CGVectorTests.swift
//  OutlawCoreGraphics
//
//  Created by Brian Mullen on 12/17/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
import Outlaw
@testable import OutlawCoreGraphics


class CGVectorTests: XCTestCase {
    fileprivate typealias keys = CGVector.ExtractableKeys
    fileprivate typealias indexes = CGVector.ExtractableIndexes
    
    func testExtractableValue() {
        let rawData: [String: CGFloat] = [keys.dx: 1,
                                          keys.dy: 2]
        let data: [String: [String: CGFloat]] = ["vector": rawData]
        let vector: CGVector = try! data.value(for: "vector")
        
        XCTAssertEqual(vector.dx, rawData[keys.dx])
        XCTAssertEqual(vector.dy, rawData[keys.dy])
    }
    
    func testIndexExtractableValue() {
        var rawData = [CGFloat](repeating: 0, count: 2)
        rawData[indexes.dx] = 1
        rawData[indexes.dy] = 2
        
        let data: [[CGFloat]] = [rawData]
        let vector: CGVector = try! data.value(for: 0)
        
        XCTAssertEqual(vector.dx, rawData[indexes.dx])
        XCTAssertEqual(vector.dy, rawData[indexes.dy])
    }
    
    func testInvalidValue() {
        let rawData: String = "Hello, Outlaw!"
        let data: [String] = [rawData]
        
        let ex = self.expectation(description: "Invalid data")
        do {
            let _: CGVector = try data.value(for: 0)
        }
        catch {
            if case OutlawError.typeMismatchWithIndex = error {
                ex.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSerializable() {
        let vector = CGVector(dx: 1, dy: 2)
        let data = vector.serialized()
        
        XCTAssertEqual(data[keys.dx], vector.dx)
        XCTAssertEqual(data[keys.dy], vector.dy)
    }
    
    func testIndexSerializable() {
        let vector = CGVector(dx: 1, dy: 2)
        let data = vector.serializedIndexes()
        
        XCTAssertEqual(data[indexes.dx], vector.dx)
        XCTAssertEqual(data[indexes.dy], vector.dy)
    }
}
