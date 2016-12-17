//
//  CGVector+Outlaw.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics
import Outlaw


extension CGVector: Value {
    public static func value(from object: Any) throws -> CGVector {
        if let data = object as? Extractable {
            let dx: CGFloat = try data.value(for: "dx")
            let dy: CGFloat = try data.value(for: "dy")
            
            return CGVector(dx: dx, dy: dy)
        }
        else if let data = object as? IndexExtractable {
            let dx: CGFloat = try data.value(for: 0)
            let dy: CGFloat = try data.value(for: 1)
            
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
        result["dx"] = self.dx
        result["dy"] = self.dy
        
        return result
    }
}
