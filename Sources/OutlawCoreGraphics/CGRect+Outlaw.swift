//
//  CGRect+Outlaw.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics
import Outlaw


public extension CGRect {
    struct ExtractableKeys {
        public static let x = "x"
        public static let y = "y"
        public static let width = "width"
        public static let height = "height"
    }
    struct ExtractableIndexes {
        public static let x: Int = 0
        public static let y: Int = 1
        public static let width: Int = 2
        public static let height: Int = 3
    }
    private typealias keys = CGRect.ExtractableKeys
    private typealias indexes = CGRect.ExtractableIndexes
}

extension CGRect: Value {
    public static func value(from object: Any) throws -> CGRect {
        if let data = object as? Extractable {
            let x: CGFloat = try data.value(for: keys.x)
            let y: CGFloat = try data.value(for: keys.y)
            let width: CGFloat = try data.value(for: keys.width)
            let height: CGFloat = try data.value(for: keys.height)
            
            return CGRect(x: x, y: y, width: width, height: height)
        }
        else if let data = object as? IndexExtractable {
            let x: CGFloat = try data.value(for: indexes.x)
            let y: CGFloat = try data.value(for: indexes.y)
            let width: CGFloat = try data.value(for: indexes.width)
            let height: CGFloat = try data.value(for: indexes.height)
            
            return CGRect(x: x, y: y, width: width, height: height)
        }
        else {
            let expectedType = "Extractable or IndexExtractable"
            throw OutlawError.typeMismatch(expected: expectedType, actual: type(of: object))
        }
    }
}

extension CGRect: Serializable {
    public func serialized() -> [String: CGFloat] {
        var result = [String: CGFloat]()
        result[keys.x] = self.origin.x
        result[keys.y] = self.origin.y
        result[keys.width] = self.width
        result[keys.height] = self.height
        
        return result
    }
}

extension CGRect: IndexSerializable {
    public func serializedIndexes() -> [CGFloat] {
        var result = [CGFloat](repeating: 0, count: 4)
        result[indexes.x] = self.origin.x
        result[indexes.y] = self.origin.y
        result[indexes.width] = self.width
        result[indexes.height] = self.height
        
        return result
    }
}
