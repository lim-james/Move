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
    
    init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) {
        red = r
        green = g
        blue = b
    }
    
    mutating func setColour(_ c: Colour) {
        red = c.red
        green = c.green
        blue = c.green
    }
    
    var value: UIColor {
        return UIColor(red, green, blue)
    }
}

extension UIColor {
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }

    static var background: UIColor {
        return UIColor(0,0,0)
    }
    
    static var border: UIColor {
        return UIColor(253,254,2)
    }
}
