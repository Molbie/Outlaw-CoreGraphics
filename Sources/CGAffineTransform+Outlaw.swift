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
    public struct ExtractableKeys {
        public static let a = "a"
        public static let b = "b"
        public static let c = "c"
        public static let d = "d"
        public static let tx = "tx"
        public static let ty = "ty"
    }
}

extension CGAffineTransform: Value {
    public static func value(from object: Any) throws -> CGAffineTransform {
        if let data = object as? Extractable {
            typealias keys = CGAffineTransform.ExtractableKeys
            
            let a: CGFloat = try data.value(for: keys.a)
            let b: CGFloat = try data.value(for: keys.b)
            let c: CGFloat = try data.value(for: keys.c)
            let d: CGFloat = try data.value(for: keys.d)
            let tx: CGFloat = try data.value(for: keys.tx)
            let ty: CGFloat = try data.value(for: keys.ty)
            
            return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
        }
        else if let data = object as? IndexExtractable {
            let a: CGFloat = try data.value(for: 0)
            let b: CGFloat = try data.value(for: 1)
            let c: CGFloat = try data.value(for: 2)
            let d: CGFloat = try data.value(for: 3)
            let tx: CGFloat = try data.value(for: 4)
            let ty: CGFloat = try data.value(for: 5)
            
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
        typealias keys = CGAffineTransform.ExtractableKeys
        
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
    public func serialized() -> [CGFloat] {
        return [self.a, self.b, self.c, self.d, self.tx, self.ty]
    }
}
