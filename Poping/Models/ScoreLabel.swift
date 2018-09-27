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
    
    init(text: String, fontColor: UIColor, fontSize: CGFloat, fontName: String){
        
        super.init()
        self.text = text
        self.fontColor = fontColor
        self.fontName = fontName
        self.fontSize = fontSize
    }
    
    // function to update the score board
    func updateScore(currentScore: Int){
        
        self.text = "Score : \(currentScore)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
