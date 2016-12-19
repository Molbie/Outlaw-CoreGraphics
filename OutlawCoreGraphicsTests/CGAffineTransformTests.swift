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
        typealias keys = CGAffineTransform.ExtractableKeys
        
        let rawData: [String: CGFloat] = [keys.a: 1,
                                          keys.b: 2,
                                          keys.c: 3,
                                          keys.d: 4,
                                          keys.tx: 5,
                                          keys.ty: 6]
        let data: [String: [String: CGFloat]] = ["transform": rawData]
        let transform: CGAffineTransform = try! data.value(for: "transform")
        
        XCTAssertEqual(transform.a, rawData[keys.a])
        XCTAssertEqual(transform.b, rawData[keys.b])
        XCTAssertEqual(transform.c, rawData[keys.c])
        XCTAssertEqual(transform.d, rawData[keys.d])
        XCTAssertEqual(transform.tx, rawData[keys.tx])
        XCTAssertEqual(transform.ty, rawData[keys.ty])
    }
    
    func testIndexExtractableValue() {
        typealias indexes = CGAffineTransform.ExtractableIndexes
        
        var rawData = [CGFloat](repeating: 0, count: 6)
        rawData[indexes.a] = 1
        rawData[indexes.b] = 2
        rawData[indexes.c] = 3
        rawData[indexes.d] = 4
        rawData[indexes.tx] = 5
        rawData[indexes.ty] = 6
        
        let data: [[CGFloat]] = [rawData]
        let transform: CGAffineTransform = try! data.value(for: 0)
        
        XCTAssertEqual(transform.a, rawData[indexes.a])
        XCTAssertEqual(transform.b, rawData[indexes.b])
        XCTAssertEqual(transform.c, rawData[indexes.c])
        XCTAssertEqual(transform.d, rawData[indexes.d])
        XCTAssertEqual(transform.tx, rawData[indexes.tx])
        XCTAssertEqual(transform.ty, rawData[indexes.ty])
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
        typealias keys = CGAffineTransform.ExtractableKeys
        
        let transform = CGAffineTransform(a: 1, b: 2, c: 3, d: 4, tx: 5, ty: 6)
        let data: [String: CGFloat] = transform.serialized()
        
        XCTAssertEqual(data[keys.a], transform.a)
        XCTAssertEqual(data[keys.b], transform.b)
        XCTAssertEqual(data[keys.c], transform.c)
        XCTAssertEqual(data[keys.d], transform.d)
        XCTAssertEqual(data[keys.tx], transform.tx)
        XCTAssertEqual(data[keys.ty], transform.ty)
    }
    
    func testIndexSerializable() {
        typealias indexes = CGAffineTransform.ExtractableIndexes
        
        let transform = CGAffineTransform(a: 1, b: 2, c: 3, d: 4, tx: 5, ty: 6)
        let data: [CGFloat] = transform.serialized()
        
        XCTAssertEqual(data[indexes.a], transform.a)
        XCTAssertEqual(data[indexes.b], transform.b)
        XCTAssertEqual(data[indexes.c], transform.c)
        XCTAssertEqual(data[indexes.d], transform.d)
        XCTAssertEqual(data[indexes.tx], transform.tx)
        XCTAssertEqual(data[indexes.ty], transform.ty)
    }
}
