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
import UIKit

class GameScene: SKScene {
    
    // NEEDED CLASS VARIABLES
    
    var timer = Timer()
    var playerPoints = 0
    var pointsLabel = SKLabelNode()
    var bubbleSize = CGSize(width: 30, height: 30)
    
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor.black
        
    }
    
    // this function creates a single bubble
    func makeBubble(){
        
        // unwraps the scene and throws an error if the scene is undefined
        guard let scene = scene else {fatalError()}
        
        let color = UIColor(hue: 1.0, saturation: 1, brightness: 1, alpha: 1)
        let bubble = SKSpriteNode(texture: nil, color: color, size: bubbleSize)
        let bubbleXPosition = randomize(number: 0) // get back to this later
        bubble.name = "bubble"
        bubble.position = CGPoint(x: bubbleXPosition, y: 0)
        addChild(bubble)
        
        
    }
    
    // Function to set up the label on the screen
    func setUpPointsLabel(){
        
        // safely unwrapping the scene node in case it is nil
        guard let scene = scene else {return}
        
        // making the point label pretty
        pointsLabel.fontSize = 30
        pointsLabel.color = SKColor.white
        pointsLabel.fontName = "helvetica"
        updatePoints(points: playerPoints)
        
        // positioning the point label
        let xPositionOfLabel = pointsLabel.frame.size.width
        let yPositionOfLabel = (scene.frame.size.height)
        let playerPointsPosition = CGPoint(x: xPositionOfLabel, y: yPositionOfLabel)
        pointsLabel.position = playerPointsPosition
        addChild(pointsLabel)
    }
    
    func generateBubbleIn(){
        
        
    }
    
    func moveBubbleToTop(bubble: SKShapeNode){
        
    }
    
    // Function to update the user points on the screen
    func updatePoints(points: Int){
        pointsLabel.text = "Score : \(points)"
    }
    
    func gameOver(status: (over: Bool, won: Bool)){
        
        guard status.over else {return}
        
        // ending the timer
        timer.invalidate()
        
        let message = status.won ? "You Won! 😁" : "You Lost 🙁"
        
        let view = SKShapeNode(rectOf: CGSize(width: 300, height: 250))
        view.fillColor = SKColor.white
        view.zPosition = 50
        view.position = self.view!.center
        addChild(view)
        
        // Game Status Label
        let gameStatusLabel = SKLabelNode()
        gameStatusLabel.text = message
        gameStatusLabel.fontSize = 40
        gameStatusLabel.fontName = "helvetica"
        gameStatusLabel.color = SKColor.black
        gameStatusLabel.position = CGPoint(x: 0, y: 60)
        view.addChild(gameStatusLabel)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func handleTouch(touch: UITouch){
        
    }
    
    func isGameOver() -> (over: Bool, won: Bool){
        
    }
    
    func randomize(number: Int){
        return arc4random_uniform(number)
    }
    
}


    

