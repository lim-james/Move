//
//  RandomPositionAlgorithm.swift
//  Move
//
//  Created by James on 21/1/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

extension ViewController {
    func randomEndPosition() -> Position {
        var x: CGFloat = CGFloat(arc4random_uniform(UInt32(tilesPerRow)));
        var y: CGFloat = CGFloat(arc4random_uniform(UInt32(tilesPerColumn)));
        while endPositions.contains(where: { didCollide(between: $0.position, and: Position(x: x, y: y)) }) {
            x = CGFloat(arc4random_uniform(UInt32(tilesPerRow)))
            y = CGFloat(arc4random_uniform(UInt32(tilesPerRow)))
        }
        return Position(x: x, y: y)
    }
    
    func randomBlockPosition() -> Position {
        var x: CGFloat = CGFloat(arc4random_uniform(UInt32(tilesPerRow)));
        var y: CGFloat = CGFloat(arc4random_uniform(UInt32(tilesPerColumn)));
        while existingPositions.contains(where: { didCollide(between: $0, and: Position(x: x, y: y)) }) {
            x = CGFloat(arc4random_uniform(UInt32(tilesPerRow)))
            y = CGFloat(arc4random_uniform(UInt32(tilesPerRow)))
        }
        return Position(x: x, y: y)
    }
    
    func randomCharacterPosition(of type: Type) -> Position {
        var x: CGFloat = CGFloat(arc4random_uniform(UInt32(tilesPerRow)));
        var y: CGFloat = CGFloat(arc4random_uniform(UInt32(tilesPerColumn)));
        while existingPositions.contains(where: { didCollide(between: $0, and: Position(x: x, y: y)) }) ||
            endPositions.contains(where: { didCollide(between: $0.position, and: Position(x: x, y: y)) && $0.type == type}) {
                x = CGFloat(arc4random_uniform(UInt32(tilesPerRow)))
                y = CGFloat(arc4random_uniform(UInt32(tilesPerRow)))
        }
        return Position(x: x, y: y)
    }
}
