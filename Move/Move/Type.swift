//
//  Types.swift
//  Move
//
//  Created by James on 21/1/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

enum Type {
    case red
    case green
    case blue
    case custom
    
    var colour: Colour {
        get {
            switch self {
            case .red: return Colour(226,34,17)
            case .green: return Colour(146,242,42)
            case .blue: return Colour(68,187,255)
            case .custom: return Colour(0, 0, 0)
            }
        }
        set {
            
        }
    }
}
