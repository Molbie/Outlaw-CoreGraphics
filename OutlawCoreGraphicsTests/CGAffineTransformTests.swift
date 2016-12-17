//
//  CGAffineTransformTests.swift
//  OutlawCoreGraphics
//
//  Created by Brian Mullen on 12/17/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
import Outlaw
@testable import OutlawCoreGraphics


class CGAffineTransformTests: XCTestCase {
    func testExtractableValue() {
        let rawData: [String: CGFloat] = ["a": 1, "b": 2, "c": 3, "d": 4, "tx": 5, "ty": 6]
        let data: [String: [String: CGFloat]] = ["transform": rawData]
        let transform: CGAffineTransform = try! data.value(for: "transform")
        
        XCTAssertEqual(transform.a, rawData["a"])
        XCTAssertEqual(transform.b, rawData["b"])
        XCTAssertEqual(transform.c, rawData["c"])
        XCTAssertEqual(transform.d, rawData["d"])
        XCTAssertEqual(transform.tx, rawData["tx"])
        XCTAssertEqual(transform.ty, rawData["ty"])
    }
    
    func testIndexExtractableValue() {
        let rawData: [CGFloat] = [1, 2, 3, 4, 5, 6]
        let data: [[CGFloat]] = [rawData]
        let transform: CGAffineTransform = try! data.value(for: 0)
        
        XCTAssertEqual(transform.a, rawData[0])
        XCTAssertEqual(transform.b, rawData[1])
        XCTAssertEqual(transform.c, rawData[2])
        XCTAssertEqual(transform.d, rawData[3])
        XCTAssertEqual(transform.tx, rawData[4])
        XCTAssertEqual(transform.ty, rawData[5])
    }
    
    func testInvalidValue() {
        let rawData: String = "Hello, Outlaw!"
        let data: [String] = [rawData]
        
        let ex = self.expectation(description: "Invalid data")
        do {
            let _: CGAffineTransform = try data.value(for: 0)
        }
        catch {
            if case OutlawError.typeMismatchWithIndex = error {
                ex.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSerializable() {
        let transform = CGAffineTransform(a: 1, b: 2, c: 3, d: 4, tx: 5, ty: 6)
        let data: [String: CGFloat] = transform.serialized()
        
        XCTAssertEqual(data["a"], transform.a)
        XCTAssertEqual(data["b"], transform.b)
        XCTAssertEqual(data["c"], transform.c)
        XCTAssertEqual(data["d"], transform.d)
        XCTAssertEqual(data["tx"], transform.tx)
        XCTAssertEqual(data["ty"], transform.ty)
    }
    
    func testIndexSerializable() {
        let transform = CGAffineTransform(a: 1, b: 2, c: 3, d: 4, tx: 5, ty: 6)
        let data: [CGFloat] = transform.serialized()
        
        XCTAssertEqual(data[0], transform.a)
        XCTAssertEqual(data[1], transform.b)
        XCTAssertEqual(data[2], transform.c)
        XCTAssertEqual(data[3], transform.d)
        XCTAssertEqual(data[4], transform.tx)
        XCTAssertEqual(data[5], transform.ty)
    }
}
