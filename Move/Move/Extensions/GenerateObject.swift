//
//  GenerateObject.swift
//  Move
//
//  Created by James on 21/1/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

extension ViewController {
    func generateTiles() {
        for x in 0...Int(tilesPerRow-1) {
            var tileBuffer = [UIButton]()
            for y in 0...Int(tilesPerColumn-1) {
                let xPosition = CGFloat(x)
                let yPosition = CGFloat(y)
                let tile = UIButton(frame: CGRect(x: xPosition*tileLength, y: yPosition*tileLength, width: tileLength, height: tileLength))
                tile.tag = Int((xPosition) * 10 + (yPosition))
                tile.addTarget(self, action: #selector(self.tileAction(_:)), for: .touchUpInside)
                tile.layer.borderWidth = 0.5
                tile.layer.borderColor = UIColor.border.cgColor
                tileBuffer.append(tile)
                gridView.addSubview(tile)
                
                if blocks.contains(where: { $0.x == CGFloat(x) && $0.y == CGFloat(y) }) {
                    tile.backgroundColor = .border
                }
                if let index = endPositions.index(where: { (end) -> Bool in
                    return didCollide(between: end.position, and: Position(x: xPosition, y: yPosition))
                }) {
                    tile.backgroundColor = endPositions[index].type.colour.value.withAlphaComponent(0.25)
                }
            }
            tiles.append(tileBuffer)
        }
    }
    
    func generateCharacter(Of type: Type, at position: Position) {
        let character = CharacterClass()
        existingPositions.append(position)
        startPositions.append(position)
        character.create(with: characterLength, at: position, of: type)
        characters.append(character)
        gridView.addSubview(character)
    }
}
