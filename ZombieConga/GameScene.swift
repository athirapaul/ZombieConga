//
//  GameScene.swift
//  ZombieConga
//
//  Created by Athira Paul on 2019-06-04.
//  Copyright © 2019 Athira Paul. All rights reserved.


import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var lastTouchLocation:CGPoint?
    var lastUpdateTime:TimeInterval = 0
    var zombieMovePointsPerSec :CGFloat = 480.0
    var dt : TimeInterval = 0
  let zombie = SKSpriteNode(imageNamed: "zombie1")
  var velocity  = CGPoint.zero
    
    
    override func didMove(to view: SKView) {
     let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = -1
        addChild(background)
        zombie.position = CGPoint(x: 400, y: 400)
        addChild(zombie)
}
    func moveZombieForward(_ location:CGPoint){
        let offset = CGPoint(x: location.x - zombie.position.x, y: location.y - zombie.position.y)
        let distance = sqrt(Double(offset.x * offset.x + offset.y * offset.y))
        let direction = CGPoint(x: offset.x / CGFloat((length)), y: offset.y / CGFloat(length))
        velocity = CGPoint(x: direction.x * zombieMovePointsPerSec,y: direction.y * zombieMovePointsPerSec)
    }
    func moveSprite(_ sprite: SKSpriteNode, velocity:CGPoint){
        let amountToMove = CGPoint(x:velocity.x * CGFloat(dt),y:velocity.y * CGFloat(dt))
        print("amount to move:\(amountToMove)")
        sprite.position = CGPoint(x: sprite.position.x + amountToMove.x, y: sprite.position.y + amountToMove.y)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch =  touches.first
            else{
                return
        }
        let touchlocation = touch.location(in: self)
        lastTouchLocation = touchlocation
        moveZombieForward(touchlocation)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch =  touches.first
            else{
                return
        }
        let touchlocation = touch.location(in: self)
        lastTouchLocation = touchlocation
        moveZombieForward(touchlocation)
    }
    override func update(_ currentTime: TimeInterval) {
        if (lastUpdateTime > 0){
            dt = currentTime - lastUpdateTime
        }
        else{
        dt = 0
    }
        lastUpdateTime = currentTime
        print("\(dt*1000)milliseconds since last update")
        if let lastTouchLocation = lastTouchLocation {
            let diff = lastTouchLocation - zombie.position
            if(diff.length() <= zombieMovePointsPerSec * CGFloat(dt)){
                
            }
    }
    
}

}
