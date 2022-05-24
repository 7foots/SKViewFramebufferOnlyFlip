
//: SpriteKit — SKView CAMetalLayer framebufferOnly bug

import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {
    private var label : SKLabelNode!
    
    override func didMove(to view: SKView) {
        // Get label node from scene and store it for use later
        label = childNode(withName: "//helloLabel") as? SKLabelNode
        label.alpha = 0.0
        let fadeInOut = SKAction.sequence([
            .fadeIn(withDuration: 2.0),
            .fadeOut(withDuration: 2.0)
        ])
        label.run(.repeatForever(fadeInOut))
        
    }
}

// Load the SKScene from 'GameScene.sks'
let frame = CGRect(x:0 , y:0, width: 640, height: 480)
let sceneView = SKView(frame: frame)

if let scene = GameScene(fileNamed: "GameScene") {
    scene.scaleMode = .aspectFill
    
    // Problem: sceneView.layer.framebufferOnly = false flips content
    (sceneView.layer as? CAMetalLayer)?.framebufferOnly = false
    
    // Solution 1
    // To fix bug, flip view content via CGAffineTransform
    // Comment next line to see bug
    sceneView.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: -1.0)
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
