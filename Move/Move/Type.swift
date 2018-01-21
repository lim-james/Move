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
            case .red: return Colour(254,0,0)
            case .green: return Colour(11,255,1)
            case .blue: return Colour(1,30,254)
            case .custom: return Colour(0, 0, 0)
            }
        }
        set {
            
        }
    }
}
