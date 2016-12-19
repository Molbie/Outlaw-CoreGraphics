//
//  CGSize+Outlaw.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics
import Outlaw


public extension CGSize {
    public struct ExtractableKeys {
        public static let width = "width"
        public static let height = "height"
    }
    public struct ExtractableIndexes {
        public static let width: Int = 0
        public static let height: Int = 1
    }
}

extension CGSize: Value {
    public static func value(from object: Any) throws -> CGSize {
        if let data = object as? Extractable {
            typealias keys = CGSize.ExtractableKeys
            
            let width: CGFloat = try data.value(for: keys.width)
            let height: CGFloat = try data.value(for: keys.height)
            
            return CGSize(width: width, height: height)
        }
        else if let data = object as? IndexExtractable {
            typealias indexes = CGSize.ExtractableIndexes
            
            let width: CGFloat = try data.value(for: indexes.width)
            let height: CGFloat = try data.value(for: indexes.height)
            
            return CGSize(width: width, height: height)
        }
        else {
            let expectedType = "Extractable or IndexExtractable"
            throw OutlawError.typeMismatch(expected: expectedType, actual: type(of: object))
        }
    }
}

extension CGSize: Serializable {
    public func serialized() -> [String: CGFloat] {
        typealias keys = CGSize.ExtractableKeys
        
        var result = [String: CGFloat]()
        result[keys.width] = self.width
        result[keys.height] = self.height
        
        return result
    }
}

extension CGSize: IndexSerializable {
    public func serialized() -> [CGFloat] {
        typealias indexes = CGSize.ExtractableIndexes
        
        var result = [CGFloat](repeating: 0, count: 2)
        result[indexes.width] = self.width
        result[indexes.height] = self.height
        
        return result
    }
}
