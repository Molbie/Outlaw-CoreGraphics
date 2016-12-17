//
//  CGSize+Outlaw.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics
import Outlaw


extension CGSize: Value {
    public static func value(from object: Any) throws -> CGSize {
        if let data = object as? Extractable {
            let width: CGFloat = try data.value(for: "width")
            let height: CGFloat = try data.value(for: "height")
            
            return CGSize(width: width, height: height)
        }
        else if let data = object as? IndexExtractable {
            let width: CGFloat = try data.value(for: 0)
            let height: CGFloat = try data.value(for: 1)
            
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
        var result = [String: CGFloat]()
        result["width"] = self.width
        result["height"] = self.height
        
        return result
    }
}
