import XCTest
@testable import OutlawCoreGraphicsTests


XCTMain([
    testCase(CGAffineTransformTests.allTests),
    testCase(CGFloatTests.allTests),
    testCase(CGLineCapTests.allTests),
    testCase(CGLineJoinTests.allTests),
    testCase(CGPointTests.allTests),
    testCase(CGRectTests.allTests),
    testCase(CGSizeTests.allTests),
    testCase(CGVectorTests.allTests)
])
