//
//  CollisionsController.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 5/15/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "CollisionsController.h"

@implementation CollisionsController

static const uint32_t playerCategory = 0x1 << 1;
static const uint32_t enemyCategory  =0x1 <<2;
static const uint32_t itemCategory  =0x1 <<4;
static const uint32_t fallingTileCategory   = 0x1 <<8;
static const uint32_t weaponCategory = 0x1 <<16;

-(void)object1:(SKPhysicsBody *) object1 didCollideWithObject2:(SKPhysicsBody *) object2 withPlayer: (PlayerData *) player withPlayerStats:(PlayerStats *)bobbette inWorld:(SKNode *) world{
    
    if (object1.categoryBitMask == playerCategory && object2.categoryBitMask == enemyCategory){
        
        self.tester = object2.node;
        
        [bobbette beginDamage:[self.tester.filheim getAtk]];
        
    }
    
    if ( object1.categoryBitMask == playerCategory && object2.categoryBitMask == itemCategory){
        
        [object2.node removeFromParent];
        
    }
    
    if ( object1.categoryBitMask == fallingTileCategory && object2.categoryBitMask == playerCategory){
        
        object1.dynamic = YES;
        object1.affectedByGravity = TRUE;
        object1.allowsRotation = FALSE;
        object1.restitution = 0.0;
        object1.friction = 0.0;
        
    }
    
    if (object1.categoryBitMask == enemyCategory && object2.categoryBitMask == weaponCategory){
        
        self.tester = object1.node;
        
        [self.tester knockbackWithPlayer: player.objSprite];
        
        if ([bobbette getAtk] - [self.tester.filheim getDef] > 0) {
            [self.tester.filheim incrementHp: (-[bobbette getAtk] + [self.tester.filheim getDef])];
        } else {
            [self.tester.filheim incrementHp: -1];
        }
        
    }
    
}

-(void)object1:(SKPhysicsBody *)object1 didEndCollideWithObject2:(SKPhysicsBody *)object2 withPlayerStats:(PlayerStats *)bobbette inWorld:(SKNode *)world {
    
    if (object1.categoryBitMask == playerCategory && object2.categoryBitMask == enemyCategory){
        
        self.tester = object2.node;
        [bobbette endDamage:[self.tester.filheim getAtk]];
        
    }

    
}

@end
