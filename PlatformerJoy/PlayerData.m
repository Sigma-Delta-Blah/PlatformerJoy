//
//  PlayerData.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 2/28/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "PlayerData.h"

@implementation PlayerData

-(void) createPlayer:(SKNode *) world withPhysics:(PhysicsController *) physics {
    
    self.jumping = FALSE;
    self.moving = FALSE;
    _groundYPos = 0;
    
    self.objSprite = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(16,31)];
    
    [physics playerPhysics:self.objSprite];
    
    self.objSprite.position = CGPointMake(32, 32);
    
    self.objSprite.name = @"camera";
    
    [world addChild:self.objSprite];
    
}

-(void) movementPlayerBegin: (NSSet *) touches inScene: (SKNode *) scene {
    
    for (UITouch *touch in touches) {
        
        self.moving = true;
<<<<<<< HEAD
        self.setTouch = touch;
=======
        CGPoint location = [touch locationInNode:scene];
        if (location.y >= CGRectGetMidY(scene.frame) + 38 && self.jumping == FALSE && fabs(self.objSprite.physicsBody.velocity.dy) <1){
            self.jumping = TRUE;
            self.objSprite.position = CGPointMake(self.objSprite.position.x, self.objSprite.position.y + 1);
            self.objSprite.physicsBody.velocity = CGVectorMake(self.objSprite.physicsBody.velocity.dx, 150);
            _groundYPos = self.objSprite.position.y - .2;
        } else {
            self.setTouch = touch;
        }
>>>>>>> parent of 7a76ec7... Merge branch 'Keith' of https://github.com/Sigma-Delta-Blah/PlatformerJoy into Keith
        
    }

}

-(void) movementPlayerEnd: (NSSet *) touches inScene: (SKNode *) scene {
    
    self.moving = FALSE;
<<<<<<< HEAD
    /*if (self.setTouch) {
     self.setTouch = nil;
     }*/
    
}

-(void)jump {
    if (self.jumping ==FALSE) {
        self.jumping = TRUE;
        self.objSprite.position = CGPointMake(self.objSprite.position.x, self.objSprite.position.y + 1);
        self.objSprite.physicsBody.velocity = CGVectorMake(self.objSprite.physicsBody.velocity.dx, 150);
        _groundYPos = self.objSprite.position.y - .2;
=======
    if (self.setTouch) {
        self.setTouch = nil;
>>>>>>> parent of 7a76ec7... Merge branch 'Keith' of https://github.com/Sigma-Delta-Blah/PlatformerJoy into Keith
    }
}

-(void) movementPlayerUpdate: (SKNode *) scene {
<<<<<<< HEAD
    CGPoint location = [self.setTouch locationInNode:scene];
    if (self.moving == TRUE && (CGRectGetMidX(scene.frame) - location.x > 12)){
        self.objSprite.physicsBody.velocity = CGVectorMake(-100, self.objSprite.physicsBody.velocity.dy);
    }
    if (self.moving == TRUE && (CGRectGetMidX(scene.frame) - location.x < -12)){
        self.objSprite.physicsBody.velocity = CGVectorMake(100, self.objSprite.physicsBody.velocity.dy);
    }
    if (self.moving == TRUE && (CGRectGetMidX(scene.frame) - location.x > -12) && (CGRectGetMidX(scene.frame) - location.x < 12)){
        self.objSprite.physicsBody.velocity = CGVectorMake(self.objSprite.physicsBody.velocity.dx*.5, self.objSprite.physicsBody.velocity.dy);
    }
=======
    
>>>>>>> parent of 7a76ec7... Merge branch 'Keith' of https://github.com/Sigma-Delta-Blah/PlatformerJoy into Keith
    if (self.jumping == TRUE && self.objSprite.physicsBody.velocity.dy ==0){
        self.jumping = FALSE;
    }
    if (self.moving == FALSE && (self.objSprite.physicsBody.velocity.dx)*(self.objSprite.physicsBody.velocity.dx) > 9){
        self.objSprite.physicsBody.velocity = CGVectorMake(self.objSprite.physicsBody.velocity.dx*.75, self.objSprite.physicsBody.velocity.dy);
    }
    if (self.moving == FALSE && (self.objSprite.physicsBody.velocity.dx)*(self.objSprite.physicsBody.velocity.dx) <= 9){
        self.objSprite.physicsBody.velocity = CGVectorMake(0, self.objSprite.physicsBody.velocity.dy);
    }
    
}

@end
