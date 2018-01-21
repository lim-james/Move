//
//  Colour.swift
//  Move
//
//  Created by James on 21/1/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

struct Colour {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
}

extension Colour {
    mutating func setColour(_ c: Colour) {
        red = c.red
        green = c.green
        blue = c.green
    }
    
    var value: UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
//    func blend(with c2: Colour) -> Colour {
//        return Colour(red: (red + c2.red)/2, green: (green + c2.green)/2, blue: (blue + c2.blue)/2)
//    }
}
