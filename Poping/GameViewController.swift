//
//  GameViewController.swift
//  Poping
//
//  Created by Medi Assumani on 9/20/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up our view to present our game
        guard let view = self.view as? SKView else {return}
        
        // set up our game scene
        let gameScene = GameScene(size: self.view.frame.size)
        gameScene.scaleMode = .aspectFit
        
        // present our game scene
        view.presentScene(gameScene)
        
        // display debug info
        view.showsFPS = true
        view.showsNodeCount = true
        
        
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
