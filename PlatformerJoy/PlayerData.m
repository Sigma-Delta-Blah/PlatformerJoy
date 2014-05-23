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
    self.timer = -1;
    _groundYPos = 0;
    
    self.objSprite = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(16,31)];
    
    [physics playerPhysics:self.objSprite];
    
    self.objSprite.position = CGPointMake(32, 32);
    
    self.objSprite.name = @"camera";
    
    self.objSprite.texture = [SKTexture textureWithImageNamed:@"Player - Mage_1.png"];
    
    [world addChild:self.objSprite];
    
}

-(void) movementPlayerBegin: (NSSet *) touches inScene: (SKNode *) scene {
    
    for (UITouch *touch in touches) {
        
        self.moving = true;
        self.setTouch = touch;
        
    }
    
}

-(void) movementPlayerEnd: (NSSet *) touches inScene: (SKNode *) scene {
    
    self.moving = FALSE;
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
    }
}

-(void) movementPlayerUpdate: (SKNode *) scene {
    CGPoint location = [self.setTouch locationInNode:scene];
    if (self.moving == TRUE && (CGRectGetMidX(scene.frame) - location.x > 12)){
        self.objSprite.physicsBody.velocity = CGVectorMake(-100, self.objSprite.physicsBody.velocity.dy);
        self.objSprite.texture = [SKTexture textureWithImageNamed:@"Player - Mage_2.png"];
    }
    if (self.moving == TRUE && (CGRectGetMidX(scene.frame) - location.x < -12)){
        self.objSprite.physicsBody.velocity = CGVectorMake(100, self.objSprite.physicsBody.velocity.dy);
        self.objSprite.texture = [SKTexture textureWithImageNamed:@"Player - Mage_1.png"];
    }
    if (self.moving == TRUE && (CGRectGetMidX(scene.frame) - location.x > -12) && (CGRectGetMidX(scene.frame) - location.x < 12)){
        self.objSprite.physicsBody.velocity = CGVectorMake(self.objSprite.physicsBody.velocity.dx*.5, self.objSprite.physicsBody.velocity.dy);
    }
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
-(void)attackInScene:(SKNode *) world direction:(int) d withPhysics:(PhysicsController *)antioch  {
    if ([world childNodeWithName:@"camera"] && _timer < 0) {
        _timer = 8;
        if (d == 1 /*Right*/) {
            _weapon = [SKSpriteNode spriteNodeWithImageNamed:@"Weapon - SWARD_1.png"];
            _weapon.position = CGPointMake(self.objSprite.position.x+14, self.objSprite.position.y-8);
        } else if (d == 2 /*Left*/){
            _weapon = [SKSpriteNode spriteNodeWithImageNamed:@"Weapon - SWARD_2.png"];
            _weapon.position = CGPointMake(self.objSprite.position.x-14, self.objSprite.position.y-8);
        }
        [antioch weaponPhysics:_weapon];
        _weapon.size = CGSizeMake(48, 9);
        [world addChild:_weapon];
    }
}

-(void)updateTimer:(SKNode *)world{
    if (_timer > 0){
        self.weapon.physicsBody.velocity = self.objSprite.physicsBody.velocity;
        _timer -=1;
    } else if (_timer == 0) {
        [world removeChildrenInArray:@[_weapon]];
        _timer -=1;
    }
    
}

@end
