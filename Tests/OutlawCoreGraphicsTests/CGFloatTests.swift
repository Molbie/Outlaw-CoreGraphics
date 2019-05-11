//
//  CGFloatTests.swift
//  OutlawCoreGraphics
//
//  Created by Brian Mullen on 12/17/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
import Outlaw
@testable import OutlawCoreGraphics


class CGFloatTests: XCTestCase {
    static var allTests = [("testExtractableValue", testExtractableValue),
                           ("testIndexExtractableValue", testIndexExtractableValue),
                           ("testInvalidValue", testInvalidValue)]
    
    func testExtractableValue() {
        let data: [String: CGFloat] = ["cgFloat": 1]
        let cgFloat: CGFloat = try! data.value(for: "cgFloat")
        
        XCTAssertEqual(cgFloat, data["cgFloat"])
    }
    
    func testIndexExtractableValue() {
        let data: [CGFloat] = [1]
        let cgFloat: CGFloat = try! data.value(for: 0)
        
        XCTAssertEqual(cgFloat, data[0])
    }
    
    func testInvalidValue() {
        let data: [String] = ["a"]
        
        let ex = self.expectation(description: "Invalid data")
        do {
            let _: CGFloat = try data.value(for: 0)
        }
        catch {
            if case OutlawError.typeMismatchWithIndex = error {
                ex.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1, handler: nil)
    }
}
