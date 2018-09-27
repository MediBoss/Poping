//
//  GameScene.swift
//  Poping
//
//  Created by Medi Assumani on 9/20/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene {
    
    // NEEDED CLASS VARIABLES
    
    var gameTimer = Timer()
    var playerPoints = 0
    var pointsLabel = SKLabelNode()
    let bubbleColor = UIColor(hue: CGFloat.random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    let bubbleSize = CGSize(width: 30, height: 30)
    var currentGameState: GameState = .gameOnGoing
    var gameCounter = 0
    let gameSpeed = Double(Int.random(in: 1...15))
    
    
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor.black
        makeBubble()
        setUpPointsLabel()
    
    }
    
    // Function to update the status of the game
    override func update(_ currentTime: TimeInterval) {
     
         // the game is not running...
        if currentGameState != .gameOnGoing { return }
        if gameCounter <= 0 {
            makeBubble()
            gameCounter = 15 * Int.random(in: 1...4)
        }else {
            gameCounter -= 1
        }
    }
 
    // Function to handle events when the bubbles are being poped
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currentGameState == .gameOver{
            
            if let view = self.view{
                currentGameState = .gameOver
                let scene = GameScene(size: view.bounds.size)
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
                view.ignoresSiblingOrder = false
            }
        }else if currentGameState == .gameOnGoing{
            if let touch = touches.first {
                let touchedBubble = self.atPoint(touch.location(in: self))
                if touchedBubble.name == "bubble"{
                    touchedBubble.removeFromParent()
                    playerPoints += 1
                    updatePlayerPointLabel()
                }
            }
            
        }
    }

    
    // this function creates a single bubble
    func makeBubble(){
        
        let color = UIColor(hue: CGFloat.random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
        let bubble = Bubble(name: "bubble", size: bubbleSize, color: bubbleColor, screenSize: self.size)
        
        addChild(bubble)
        
        moveBubbleToTop(bubble: bubble)
    }
    
    // Function to set up the label on the screen
    func setUpPointsLabel(){
        
        pointsLabel.text = "Current Score: \(playerPoints)"
        pointsLabel.position = CGPoint(x: (self.size.width/2), y: (self.size.height - 80))
        pointsLabel.fontColor = .cyan
        pointsLabel.fontSize = 30
        
        addChild(pointsLabel)
    }
 
    // Function to set up the game over label
    func setUpGameOverLabel(){
        
        let gameOverLabel = SKLabelNode()
        gameOverLabel.text = "Game Over 😣"
        gameOverLabel.fontColor = .cyan
        gameOverLabel.fontName = "Helvetica"
        gameOverLabel.fontSize = 30
        gameOverLabel.position = CGPoint(x: (self.size.width/2), y: (self.size.height/2))
        
        addChild(gameOverLabel)
    }
    
    
    // Function to update the score label
    func updatePlayerPointLabel(){
        
        if playerPoints < 0{
            gameOver()
        }else{
            pointsLabel.text = "Current Score : \(playerPoints)"
        }
    }
    
    
    //Function to move the bubble class
    func moveBubbleToTop(bubble: SKSpriteNode){
        
        let moveBubbleUp = SKAction.moveTo(y: size.height, duration: gameSpeed)
        let sequence = SKAction.sequence([moveBubbleUp, .removeFromParent()])
        
        bubble.run(sequence){
            self.playerPoints -= 1
            self.updatePlayerPointLabel()
        }
    }
    
    // Function to update the user points on the screen
    func updatePoints(points: Int){
        pointsLabel.text = "Score : \(points)"
    }
    
    
    // Function to handle events when the game is over
    func gameOver(){
        
        currentGameState = .gameOver
        removeFromParent()
        setUpGameOverLabel()
    
    }
}


    

