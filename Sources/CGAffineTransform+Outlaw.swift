//
//  CGAffineTransform+Outlaw.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics
import Outlaw


extension CGAffineTransform: Value {
    public static func value(from object: Any) throws -> CGAffineTransform {
        if let data = object as? Extractable {
            let a: CGFloat = try data.value(for: "a")
            let b: CGFloat = try data.value(for: "b")
            let c: CGFloat = try data.value(for: "c")
            let d: CGFloat = try data.value(for: "d")
            let tx: CGFloat = try data.value(for: "tx")
            let ty: CGFloat = try data.value(for: "ty")
            
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
        var result = [String: CGFloat]()
        result["a"] = self.a
        result["b"] = self.b
        result["c"] = self.c
        result["d"] = self.d
        result["tx"] = self.tx
        result["ty"] = self.ty
        
        return result
    }
}

extension CGAffineTransform: IndexSerializable {
    public func serialized() -> [CGFloat] {
        return [self.a, self.b, self.c, self.d, self.tx, self.ty]
    }
}
