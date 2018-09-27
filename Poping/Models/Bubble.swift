//
//  Bubble.swift
//  Poping
//
//  Created by Medi Assumani on 9/25/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Bubble: SKShapeNode{

    
    override init(){
        super.init()
    }
    
    convenience init(name: String, radius: CGFloat, color: UIColor, screenSize: CGSize) {

        //self.init()
        self.init(circleOfRadius: radius)
        self.fillColor = color
        self.name = name
        setUp(screenWidth: screenSize.width)
    }
    
    
    func setUp(screenWidth: CGFloat){
        
        let x = Int.random(in: 20...Int(screenWidth - 20))
        self.position = CGPoint(x: x, y: 0)
    }
    
/*
    func random(n: Int) -> Int{
        return Int(arc4random()) % n
    }
    */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
