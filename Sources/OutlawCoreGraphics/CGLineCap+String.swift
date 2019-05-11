//
//  CGLineCap+String.swift
//  OutlawExtensions
//
//  Created by Brian Mullen on 12/11/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import CoreGraphics


public extension CGLineCap {
    struct StringValues {
        public static let butt = "butt"
        public static let round = "round"
        public static let square = "square"
    }
    private typealias strings = CGLineCap.StringValues
}

public extension CGLineCap {
    init?(stringValue: String) {
        switch stringValue.lowercased() {
            case strings.butt:
                self = .butt
            case strings.round:
                self = .round
            case strings.square:
                self = .square
            default:
                return nil
        }
    }
    
    var stringValue: String {
        let result: String
        switch self {
            case .butt:
                result = strings.butt
            case .round:
                result = strings.round
            case .square:
                result = strings.square
            @unknown default:
                fatalError()
        }
        
        return result
    }
}
