//
//  ViewController.swift
//  Move
//
//  Created by James on 20/1/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var width: CGFloat!
    var height: CGFloat!
    
    var tileLength: CGFloat!
    
    var gridWidth: CGFloat!
    var gridHeight: CGFloat!
    var gridView: UIView!
    
    var characterLength: CGFloat!
    
    var existingPosition = [Position]()
    
    var blocks = [Position(x: 1, y: 2),
                  Position(x: 1, y: 3),]
    
    var player = PlayerClass()
    
    var enemies = [EnemyClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        width = view.frame.width
        height = view.frame.height
        
        gridWidth = width * 3/5
        gridHeight = width * 4/5
        gridView = UIView()
        gridView.frame.size = CGSize(width: gridWidth, height: gridHeight)
        gridView.center = view.center
        gridView.layer.borderWidth = 1
        gridView.layer.borderColor = UIColor.white.cgColor
        view.addSubview(gridView)
        
        tileLength = width/5
        generateTiles()
        
        characterLength = tileLength/2
        
        player.create(with: characterLength, at: Position(x: CGFloat(arc4random_uniform(3)), y: CGFloat(arc4random_uniform(4))))
        gridView.addSubview(player)
        
        for _ in 0...3 {
            let enemy = EnemyClass()
            enemy.create(with: characterLength, at: Position(x: CGFloat(arc4random_uniform(3)), y: CGFloat(arc4random_uniform(4))))
            enemies.append(enemy)
            gridView.addSubview(enemy)
        }
    }
    
    func generateTiles() {
        for x in 0...2 {
            for y in 0...3 {
                let xPosition = CGFloat(x)
                let yPosition = CGFloat(y)
                let tile = UIButton(frame: CGRect(x: xPosition*tileLength, y: yPosition*tileLength, width: tileLength, height: tileLength))
                tile.tag = Int((xPosition) * 10 + (yPosition))
                tile.addTarget(self, action: #selector(self.tileAction(_:)), for: .touchUpInside)
                if blocks.contains(where: { $0.x == CGFloat(x) && $0.y == CGFloat(y) }) {
                    tile.backgroundColor = .white
                }
                tile.layer.borderWidth = 0.5
                tile.layer.borderColor = UIColor.white.cgColor
                gridView.addSubview(tile)
            }
        }
    }
    
    @objc func tileAction(_ sender: UIButton) {
        let position = coordinateOf(sender.tag)
        if !blocks.contains(where: { $0.x == position.x && $0.y == position.y }) {
            player.move(to: position)
            for e in enemies {
                e.move(to: position)
                if didCollide(between: e, and: player) {
                    end()
                }
            }
        }
    }

    func coordinateOf(_ i: Int) -> Position {
        var position = Position()
        for y in 0...9 {
            if (i-y) % 10 == 0 {
                position.y = CGFloat(y)
                break
            }
        }
        position.x = (CGFloat(i)-position.y)/10
        return position
    }
    
    func randomPosition() -> Position {
        return Position(x: 0, y: 0)
    }
    
    func didCollide(between a: CharacterClass, and b: CharacterClass) -> Bool {
        return a.position.x == b.position.x && a.position.y == b.position.y
    }
    
    func end() {
        view.backgroundColor = .red
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
