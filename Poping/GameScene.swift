//
//  GameScene.swift
//  Poping
//
//  Created by Medi Assumani on 9/20/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation

class GameScene: SKScene {
    
    func makeBox() {
        
        // define a size for a box
        let boxSize = CGSize(width: 40, height: 40)
        // make a red box of size
        let box = SKSpriteNode(texture: nil, color: .red, size: boxSize)
        box.name = "box"
        
        // Get a random possition within the width of the scene
        let x = CGFloat(randomize(number: Int(size.width - 40)) + 20)
        
        // position the box
        box.position.x = x
        box.position.y = 0
        
        // Add the box
        addChild(box)
        
        // craete an action to move the move up teh screen
        let moveUp = SKAction.moveTo(y: size.height, duration: 4)
        let seq = SKAction.sequence([moveUp, .removeFromParent()])
        box.run(seq)
    }
    
    // function that returns a random int from 0 to n-1
    func randomize(number: Int) -> Int{
        return Int(arc4random()) % number
    }
    
    override func didMove(to view: SKView) {
        
        // make a repeating action that will call the method makeBox
        let wait = SKAction.wait(forDuration: 1.5)
        
        //this will call the function below
        let makeBox = SKAction.run{
            self.makeBox()
        }
        
        let seq = SKAction.sequence([wait, makeBox])
        let rep = SKAction.repeatForever(seq)
        
        run(rep)

    }
    
}
