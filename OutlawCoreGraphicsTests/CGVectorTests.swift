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
    func testExtractableValue() {
        let rawData: [String: CGFloat] = ["dx": 1, "dy": 2]
        let data: [String: [String: CGFloat]] = ["vector": rawData]
        let vector: CGVector = try! data.value(for: "vector")
        
        XCTAssertEqual(vector.dx, rawData["dx"])
        XCTAssertEqual(vector.dy, rawData["dy"])
    }
    
    func testIndexExtractableValue() {
        let rawData: [CGFloat] = [1, 2]
        let data: [[CGFloat]] = [rawData]
        let vector: CGVector = try! data.value(for: 0)
        
        XCTAssertEqual(vector.dx, rawData[0])
        XCTAssertEqual(vector.dy, rawData[1])
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
        let data: [String: CGFloat] = vector.serialized()
        
        XCTAssertEqual(data["dx"], vector.dx)
        XCTAssertEqual(data["dy"], vector.dy)
    }
    
    func testIndexSerializable() {
        let vector = CGVector(dx: 1, dy: 2)
        let data: [CGFloat] = vector.serialized()
        
        XCTAssertEqual(data[0], vector.dx)
        XCTAssertEqual(data[1], vector.dy)
    }
}
