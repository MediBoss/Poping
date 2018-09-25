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
    var bubbleSize = CGSize(width: 30, height: 30)
    var currentGameState: GameState = .gameOnGoing
    var gameCounter = 0
    let gameSpeed = Double(Int.random(in: 1...15))
    
    
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor.black
        pointsLabel.text = "Current Score: \(playerPoints)"
        pointsLabel.position = CGPoint(x: (self.size.width/2), y: (self.size.height - 80))
        pointsLabel.fontColor = .cyan
        pointsLabel.fontSize = 30
        
        addChild(pointsLabel)
        
        //setUpPointsLabel()
    
    }
    
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
                //view.showsFPS = true
                //view.showsNodeCount = true
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
        
        let bubbleColor = UIColor(hue: CGFloat.random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
        let bubbleXposition = Int.random(in: 30...Int(self.size.width - 30))
        let bubble = SKSpriteNode(texture: nil, color: bubbleColor, size: bubbleSize)
        
        
        bubble.name = "bubble"
        bubble.position = CGPoint(x: bubbleXposition, y: 0)
        addChild(bubble)
        
        
        let moveBubbleUp = SKAction.moveTo(y: size.height, duration: gameSpeed)
        let sequence = SKAction.sequence([moveBubbleUp, .removeFromParent()])
        
        bubble.run(sequence){
            self.playerPoints -= 1
            self.updatePlayerPointLabel()
        }
        
    }
    /*
    // Function to set up the label on the screen
    func setUpPointsLabel(){
        
        if let view = self.view{
            // making the point label pretty
            pointsLabel.fontSize = 30
            pointsLabel.color = SKColor.white
            updatePoints(points: playerPoints)
            
            // positioning the point label
            let xPositionOfLabel = pointsLabel.frame.size.width
            let yPositionOfLabel = (view.frame.size.height)
            let playerPointsPosition = CGPoint(x: xPositionOfLabel, y: yPositionOfLabel)
            pointsLabel.position = playerPointsPosition
            addChild(pointsLabel)
        }
    }
    */
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
    
    
    
    func generateBubbleIn(){
        
        
    }
    
    func moveBubbleToTop(bubble: SKShapeNode){
        
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
    
  /*
    func touchedABubble(touch: UITouch) -> SKNode? {
        
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        guard touchedNode.name == "Bubble" else {return nil}
        
        return touchedNode
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {return}
        
        handleTouch(touch: touch)
    }
    
    // when the bubble has been taped
    func handleTouch(touch: UITouch){
        
        guard let bubbleTouched = touchedABubble(touch: touch) else {return}
    
        playerPoints += 1
        updatePoints(points: playerPoints)
        bubbleTouched.removeFromParent()
    }
    
    func isGameOver() -> (over: Bool, won: Bool){
        
    }
    
    func randomize(number: Int){
        return arc4random_uniform(UIInt32(number))
    }
    */
}


    

