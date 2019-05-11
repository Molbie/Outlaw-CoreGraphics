//
//  CGVector+Outlaw.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics
import Outlaw


public extension CGVector {
    struct ExtractableKeys {
        public static let dx = "dx"
        public static let dy = "dy"
    }
    struct ExtractableIndexes {
        public static let dx: Int = 0
        public static let dy: Int = 1
    }
    private typealias keys = CGVector.ExtractableKeys
    private typealias indexes = CGVector.ExtractableIndexes
}

extension CGVector: Value {
    public static func value(from object: Any) throws -> CGVector {
        if let data = object as? Extractable {
            let dx: CGFloat = try data.value(for: keys.dx)
            let dy: CGFloat = try data.value(for: keys.dy)
            
            return CGVector(dx: dx, dy: dy)
        }
        else if let data = object as? IndexExtractable {
            let dx: CGFloat = try data.value(for: indexes.dx)
            let dy: CGFloat = try data.value(for: indexes.dy)
            
            return CGVector(dx: dx, dy: dy)
        }
        else {
            let expectedType = "Extractable or IndexExtractable"
            throw OutlawError.typeMismatch(expected: expectedType, actual: type(of: object))
        }
    }
}

extension CGVector: Serializable {
    public func serialized() -> [String: CGFloat] {
        var result = [String: CGFloat]()
        result[keys.dx] = self.dx
        result[keys.dy] = self.dy
        
        return result
    }
}

extension CGVector: IndexSerializable {
    public func serializedIndexes() -> [CGFloat] {
        var result = [CGFloat](repeating: 0, count: 2)
        result[indexes.dx] = self.dx
        result[indexes.dy] = self.dy
        
        return result
    }
}
