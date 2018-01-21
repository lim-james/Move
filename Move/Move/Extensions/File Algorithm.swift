//
//  File Algorithm.swift
//  Move
//
//  Created by James on 21/1/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

extension ViewController {
    
    /*
     x y
     (blocks)              x y
     (end position) (type) x y
     (characters)   (type) x y
     */
    
    func generateFile() {
        print(Int(tilesPerRow), Int(tilesPerColumn))
        var str = "\(blocks.count)"
        for b in blocks {
            str = str + " \(Int(b.x)) \(Int(b.y))"
        }
        print(str)
        str = "\(endPositions.count)"
        for e in endPositions {
            str = str + " \(e.type.hashValue) \(Int(e.position.x)) \(Int(e.position.y))"
        }
        print(str)
        str = "\(startPositions.count)"
        for c in characters {
            str = str + " \(c.type!.hashValue) \(Int(c.position.x)) \(Int(c.position.y))"
        }
        print(str)
    }
    
    func contents(of name: String) -> [String] {
        var content = [String]()
        if let path = Bundle.main.path(forResource: name, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                content = data.components(separatedBy: .newlines)
            } catch {
                print(error)
            }
        }
        return content
    }
    
    func create(level: Int, with contents: [String]) {
        let tilesContent = contents[0 + level*5].components(separatedBy: " ")
        tilesPerRow = CGFloat(Int(tilesContent[0])!)
        tilesPerColumn = CGFloat(Int(tilesContent[1])!)
        
        let blocksContent = contents[1 + level*5].components(separatedBy: " ")
        for i in 0 ..< Int(blocksContent[0])! {
            let x = CGFloat(Int(blocksContent[i*2+1])!)
            let y = CGFloat(Int(blocksContent[i*2+2])!)
            blocks.append(Position(x: x, y: y))
        }
        
        let endContent = contents[2 + level*5].components(separatedBy: " ")
        for i in 0 ..< Int(endContent[0])! {
            let newType = type(of: Int(endContent[i*3+1])!)
            let x = CGFloat(Int(endContent[i*3+2])!)
            let y = CGFloat(Int(endContent[i*3+3])!)
            endPositions.append(EndPosition(position: Position(x: x, y: y), type: newType))
        }
        
        let characterContent = contents[3 + level*5].components(separatedBy: " ")
        for i in 0 ..< Int(characterContent[0])! {
            let newType = type(of: Int(characterContent[i*3+1])!)
            let x = CGFloat(Int(characterContent[i*3+2])!)
            let y = CGFloat(Int(characterContent[i*3+3])!)
            generateCharacter(Of: newType, at: Position(x: x, y: y))
        }
    }
    
    func type(of i: Int) -> Type {
        switch i {
        case 0: return .red
        case 1: return .green
        case 2: return .blue
        default: return .custom
        }
    }
}
