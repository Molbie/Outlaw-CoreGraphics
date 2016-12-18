//
//  CGFloat+Outlaw.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics
import Outlaw


extension CGFloat: Value {
    public static func value(from object: Any) throws -> CGFloat {
        let value: CGFloat
        
        switch object {
        case let rawValue as Double:
            value = ValueType(rawValue)
        case let rawValue as CGFloat:
            value = ValueType(rawValue)
        case let rawValue as Float:
            value = ValueType(rawValue)
        case let rawValue as NSNumber:
            value = ValueType(rawValue.doubleValue)
        default:
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
