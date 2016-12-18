//
//  CGLineJoin+String.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics


public extension CGLineJoin {
    public struct StringValues {
        public static let miter = "miter"
        public static let round = "round"
        public static let bevel = "bevel"
    }
}

public extension CGLineJoin {
    public init?(stringValue: String) {
        typealias strings = CGLineJoin.StringValues
        
        switch stringValue.lowercased() {
            case strings.miter:
                self = .miter
            case strings.round:
                self = .round
            case strings.bevel:
                self = .bevel
            default:
                return nil
        }
    }
    
    public var stringValue: String {
        typealias strings = CGLineJoin.StringValues
        
        let result: String
        switch self {
            case .miter:
                result = strings.miter
            case .round:
                result = strings.round
            case .bevel:
                result = strings.bevel
        }
        
        return result
    }
}
