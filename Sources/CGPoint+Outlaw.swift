//
//  CGPoint+Outlaw.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics
import Outlaw


extension CGPoint: Value {
    public static func value(from object: Any) throws -> CGPoint {
        if let data = object as? Extractable {
            let x: CGFloat = try data.value(for: "x")
            let y: CGFloat = try data.value(for: "y")
            
            return CGPoint(x: x, y: y)
        }
        else if let data = object as? IndexExtractable {
            let x: CGFloat = try data.value(for: 0)
            let y: CGFloat = try data.value(for: 1)
            
            return CGPoint(x: x, y: y)
        }
        else {
            let expectedType = "Extractable or IndexExtractable"
            throw OutlawError.typeMismatch(expected: expectedType, actual: type(of: object))
        }
    }
}

extension CGPoint: Serializable {
    public func serialized() -> [String: CGFloat] {
        var result = [String: CGFloat]()
        result["x"] = self.x
        result["y"] = self.y
        
        return result
    }
}

extension CGPoint: IndexSerializable {
    public func serialized() -> [CGFloat] {
        return [self.x, self.y]
    }
}
