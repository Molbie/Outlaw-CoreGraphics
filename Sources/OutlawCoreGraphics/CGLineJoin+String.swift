//
//  CGLineJoin+String.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics


public extension CGLineJoin {
    struct StringValues {
        public static let miter = "miter"
        public static let round = "round"
        public static let bevel = "bevel"
    }
    private typealias strings = CGLineJoin.StringValues
}

public extension CGLineJoin {
    init?(stringValue: String) {
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
    
    var stringValue: String {
        let result: String
        switch self {
            case .miter:
                result = strings.miter
            case .round:
                result = strings.round
            case .bevel:
                result = strings.bevel
            @unknown default:
                fatalError()
        }
        
        return result
    }
}
