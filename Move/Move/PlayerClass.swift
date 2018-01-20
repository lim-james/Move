//
//  PlayerClass.swift
//  Move
//
//  Created by James on 20/1/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

class PlayerClass: CharacterClass {
    override func create(with newLength: CGFloat, at newPosition: Position) {
        super.create(with: newLength, at: newPosition)
        backgroundColor = .green
    }
}
