//
//  CGAffineTransform+Outlaw.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics
import Outlaw


public extension CGAffineTransform {
    struct ExtractableKeys {
        public static let a = "a"
        public static let b = "b"
        public static let c = "c"
        public static let d = "d"
        public static let tx = "tx"
        public static let ty = "ty"
    }
    struct ExtractableIndexes {
        public static let a: Int = 0
        public static let b: Int = 1
        public static let c: Int = 2
        public static let d: Int = 3
        public static let tx: Int = 4
        public static let ty: Int = 5
    }
    private typealias keys = CGAffineTransform.ExtractableKeys
    private typealias indexes = CGAffineTransform.ExtractableIndexes
}

extension CGAffineTransform: Value {
    public static func value(from object: Any) throws -> CGAffineTransform {
        if let data = object as? Extractable {
            let a: CGFloat = try data.value(for: keys.a)
            let b: CGFloat = try data.value(for: keys.b)
            let c: CGFloat = try data.value(for: keys.c)
            let d: CGFloat = try data.value(for: keys.d)
            let tx: CGFloat = try data.value(for: keys.tx)
            let ty: CGFloat = try data.value(for: keys.ty)
            
            return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
        }
        else if let data = object as? IndexExtractable {
            let a: CGFloat = try data.value(for: indexes.a)
            let b: CGFloat = try data.value(for: indexes.b)
            let c: CGFloat = try data.value(for: indexes.c)
            let d: CGFloat = try data.value(for: indexes.d)
            let tx: CGFloat = try data.value(for: indexes.tx)
            let ty: CGFloat = try data.value(for: indexes.ty)
            
            return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
        }
        else {
            let expectedType = "Extractable or IndexExtractable"
            throw OutlawError.typeMismatch(expected: expectedType, actual: type(of: object))
        }
    }
}

extension CGAffineTransform: Serializable {
    public func serialized() -> [String: CGFloat] {
        var result = [String: CGFloat]()
        result[keys.a] = self.a
        result[keys.b] = self.b
        result[keys.c] = self.c
        result[keys.d] = self.d
        result[keys.tx] = self.tx
        result[keys.ty] = self.ty
        
        return result
    }
}

extension CGAffineTransform: IndexSerializable {
    public func serializedIndexes() -> [CGFloat] {
        var result = [CGFloat](repeating: 0, count: 6)
        result[indexes.a] = self.a
        result[indexes.b] = self.b
        result[indexes.c] = self.c
        result[indexes.d] = self.d
        result[indexes.tx] = self.tx
        result[indexes.ty] = self.ty
        
        return result
    }
}
