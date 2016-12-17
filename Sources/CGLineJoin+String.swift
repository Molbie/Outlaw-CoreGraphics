//
//  CGLineJoin+String.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics


public extension CGLineJoin {
    public init?(stringValue: String) {
        switch stringValue.lowercased() {
            case "miter":
                self = .miter
            case "round":
                self = .round
            case "bevel":
                self = .bevel
            default:
                return nil
        }
    }
    
    public var stringValue: String {
        let result: String
        
        switch self {
            case .miter:
                result = "miter"
            case .round:
                result = "round"
            case .bevel:
                result = "bevel"
        }
        
        return result
    }
}
