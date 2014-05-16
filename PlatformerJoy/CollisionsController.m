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
static const uint32_t tileCategory   = 0x1 <<8;

-(void)object1:(SKPhysicsBody *) object1 didCollideWithObject2:(SKPhysicsBody *) object2 withPlayerStats:(PlayerStats *)bobbette withEnemy:(BasicEnemy *)enemy inWorld:(SKNode *) world{
    
    if (object1.categoryBitMask == playerCategory && object2.categoryBitMask == enemyCategory){
        [bobbette incrementHp:-[enemy.filheim getAtk]];
        [bobbette incrementMana:-1];
    }
    
    if ( object1.categoryBitMask == playerCategory && object2.categoryBitMask == itemCategory){
        
        [object2.node removeFromParent];
        
    }
    
}

@end
