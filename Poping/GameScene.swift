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
    
    
    
    override func didMove(to view: SKView) {
        
    }
    
    // this function creates a single bubble
    func makeBubble() -> SKShapeNode{
        
        
        
        
        
    }
    
    // Function to set up the label on the screen
    func setUpPointsLabel(){
        
        // safely unwrapping the scene node in case it is nil
        guard let scene = scene else {return}
        
        // making the point label pretty
        pointsLabel.fontSize = 30
        pointsLabel.color = UIColor.white
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
    
    func gameOver(status: (lost: Bool, won: Bool)){
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func handleTouch(touch: UITouch){
        
    }
    
    func isGameOver() -> (lost: Bool, won: Bool){
        
    }
    
    
}


    

