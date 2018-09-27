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
import GameplayKit

class Bubble: SKSpriteNode{
    
    //var screenSize: CGSize
    
    init(name: String, size:CGSize, color: UIColor, screenSize: CGSize) {
        super.init(texture: nil, color: color, size: size)
        self.name = name
        
    }
    
    
    func setUp(screenSize: CGSize){
        
        let x = Int.random(in: 20...Int(screenSize.width - 20))
        self.position = CGPoint(x: x, y: 0)
    }
    

    func random(n: Int) -> Int{
        return Int(arc4random()) % n
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
