//
//  ScoreLabel.swift
//  Poping
//
//  Created by Medi Assumani on 9/26/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation
import SpriteKit

class ScoreLabel: SKLabelNode{
    
    var currentScore = 0
    
    init(text: String, fontColor: UIColor, fontSize: CGFloat, fontName: String){
        
        super.init()
        self.text = text
        self.fontColor = fontColor
        self.fontName = fontName
        self.fontSize = fontSize
        //self.position = position
    }
    
    /* Function to update the score board
     @param points: The current points of the player
    */
    func updateScore(points: Int){
        currentScore += points
    }
    
    func updateScreen(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
