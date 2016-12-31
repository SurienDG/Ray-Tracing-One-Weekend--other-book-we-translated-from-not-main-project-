//
//  GameScene.swift
//  Rays123
//
//  Created by Surien on 2016-04-15.
//  Copyright (c) 2016 Surien. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        let width = 400
        let height = 200
        let zoom = 10
        var pixelSet = makePixelSet(width, height, zoom)
        //checked to see if right image is produced at the side
        var image = UIImage(CIImage:imageFromPixels(pixelSet))
        //image
        // our rectangle for the drawing size
        let rect = CGRectMake(0, 0, image.size.width, image.size.height)
        // we create our graphics context at the size of our image
        UIGraphicsBeginImageContextWithOptions(CGSize(width: rect.width, height: rect.height), true, 0)
        // we retrieve it
        let context = UIGraphicsGetCurrentContext()
        // we set our color to white (this will be the text color)
        // we set our color to white (this will be the text color)
        
        
        // we draw our image to the graphics context
        image.drawInRect(rect)
        
        
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // we create a texture, pass the UIImage
        var texture = SKTexture(image: newImage)
        
        // wrap it inside a sprite node
        var sprite = SKSpriteNode(texture:texture)
        
        // we scale it a bit
        sprite.setScale(0.5)
        
        // we position it
        sprite.position = CGPoint (x: 510, y: 300)
        
        self.addChild(sprite)
        //  self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
           /* let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)*/
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
