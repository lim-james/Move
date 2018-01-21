import UIKit

class ViewController: UIViewController {
    
    var width: CGFloat!
    var height: CGFloat!
    
    let tilesPerRow: CGFloat = 4 // x
    let tilesPerColumn: CGFloat = 4 // y
    
    var tileLength: CGFloat!
    var tiles = [[UIButton]]()
    
    var gridWidth: CGFloat!
    var gridHeight: CGFloat!
    var gridView: UIView!
    
    var characterLength: CGFloat!
    
    var existingPositions = [Position]() // inclusive of blocks and start
    
    var blocks = [Position]()
    
    var startPositions = [Position]()
    var endPositions = [EndPosition]()
    
    var characters = [CharacterClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        width = view.frame.width
        height = view.frame.height
        
        tileLength = width/5
        characterLength = tileLength/2
        
        gridWidth = width * tilesPerRow/5
        gridHeight = width * tilesPerColumn/5
        gridView = UIView()
        gridView.frame.size = CGSize(width: gridWidth, height: gridHeight)
        gridView.center = view.center
        gridView.layer.borderWidth = 1
        gridView.layer.borderColor = UIColor.border.cgColor
        view.addSubview(gridView)
        
        for _ in 0...1 {
            let position = randomBlockPosition()
            blocks.append(position)
            existingPositions.append(position)
        }
        
        endPositions.append(EndPosition(position: randomEndPosition(), type: .red))
        endPositions.append(EndPosition(position: randomEndPosition(), type: .green))
        endPositions.append(EndPosition(position: randomEndPosition(), type: .blue))
        
        generate(2, characterOf: .red)
        generate(2, characterOf: .green)
        generate(2, characterOf: .blue)
        
        generateTiles()
    }
    
    @objc func tileAction(_ sender: UIButton) {
        let position = coordinateOf(sender.tag)
        if !blocks.contains(where: { $0.x == position.x && $0.y == position.y }) {
            for c1 in characters {
                if c1.movable == true {
                    c1.move(to: position)
                    
                    if let _ = endPositions.index(where: { (end) -> Bool in
                        return didCollide(between: end.position, and: c1.position) && end.type == c1.type
                    }) {
                        c1.movable = false
                        blocks.append(c1.position)
                        UIView.animate(withDuration: 0.5, animations: {
                            self.tiles[Int(c1.position.x)][Int(c1.position.y)].backgroundColor = c1.backgroundColor
                        })
                    }
                    
                    for c2 in characters {
                        if c1.type != c2.type && didCollide(between: c1.position, and: c2.position) {
                            end()
                        }
                    }
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
    
    func didCollide(between a: Position, and b: Position) -> Bool {
        return a.x == b.x && a.y == b.y
    }
    
    func end() {
        view.backgroundColor = .red
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
