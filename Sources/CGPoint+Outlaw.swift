//
//  CGPoint+Outlaw.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics
import Outlaw


public extension CGPoint {
    public struct ExtractableKeys {
        public static let x = "x"
        public static let y = "y"
    }
}

extension CGPoint: Value {
    public static func value(from object: Any) throws -> CGPoint {
        if let data = object as? Extractable {
            typealias keys = CGPoint.ExtractableKeys
            
            let x: CGFloat = try data.value(for: keys.x)
            let y: CGFloat = try data.value(for: keys.y)
            
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
        typealias keys = CGPoint.ExtractableKeys
        
        var result = [String: CGFloat]()
        result[keys.x] = self.x
        result[keys.y] = self.y
        
        return result
    }
}

extension CGPoint: IndexSerializable {
    public func serialized() -> [CGFloat] {
        return [self.x, self.y]
    }
}
