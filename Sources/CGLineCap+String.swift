//
//  CGLineCap+String.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics


public extension CGLineCap {
    public init?(stringValue: String) {
        switch stringValue.lowercased() {
            case "butt":
                self = .butt
            case "round":
                self = .round
            case "square":
                self = .square
            default:
                return nil
        }
    }
    
    public var stringValue: String {
        let result: String
        
        switch self {
            case .butt:
                result = "butt"
            case .round:
                result = "round"
            case .square:
                result = "square"
        }
        
        return result
    }
}
