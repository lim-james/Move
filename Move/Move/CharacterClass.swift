//
//  CharacterClass.swift
//  Move
//
//  Created by James on 20/1/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

class CharacterClass: UIView {
    
    var length: CGFloat!
    var position: Position!
    
    var padding: CGFloat!

    func create(with newLength: CGFloat, at newPosition: Position) {
        length = newLength
        position = newPosition
        
        frame.size = CGSize(width: length, height: length)
        center = screenPosition(of: position)
    }
    
    func move(to newPosition: Position) {
        if position.x == newPosition.x {
            let distance = position.y - newPosition.y
            if distance == -1 || distance == 1 {
                position = newPosition
            }
        } else if position.y == newPosition.y {
            let distance = position.x - newPosition.x
            if distance == -1 || distance == 1 {
                position = newPosition
            }
        }
        UIView.animate(withDuration: 0.5) {
            self.center = self.screenPosition(of: self.position)
        }
    }
    
    func screenPosition(of p: Position) -> CGPoint {
        let x = (p.x) * length*2 + length
        let y = (p.y) * length*2 + length
        return CGPoint(x: x, y: y)
    }

}
