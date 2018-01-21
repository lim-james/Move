// Merge Cells
// Different end points
// Fewest Moves


import UIKit

class CharacterClass: UIView {
    
    var length: CGFloat!
    var position: Position!
    var type: Type!
    var movable = true

    func create(with newLength: CGFloat, at newPosition: Position, of newType: Type) {
        length = newLength
        position = newPosition
        type = newType
        
        frame.size = CGSize(width: length, height: length)
        center = screenPosition(of: position)
        backgroundColor = type.colour.value
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
