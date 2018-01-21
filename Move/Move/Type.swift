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
            case .red: return Colour(red: 255, green: 0, blue: 0)
            case .green: return Colour(red: 0, green: 255, blue: 0)
            case .blue: return Colour(red: 0, green: 0, blue: 255)
            case .custom: return Colour(red: 0, green: 0, blue: 255)
            }
        }
        set {
            
        }
    }
}
