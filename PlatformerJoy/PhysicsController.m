//
//  PhysicsController.m
//  PlatformerJoy
//
//  Created by block7 on 12/13/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import "PhysicsController.h"

@implementation PhysicsController

static const uint32_t playerCategory = 0x1 << 1;
static const uint32_t enemyCategory  =0x1 <<0;
static const uint32_t itemCategory  =0x1 <<2;
static const uint32_t tileCategory   = 0x1 <<3;

-(void)tilePhysics:(SKSpriteNode *) sprite{
    
    sprite.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(16, 16)];
    sprite.physicsBody.dynamic = NO;
    sprite.physicsBody.affectedByGravity = NO;
    sprite.physicsBody.restitution = 0.0;
    sprite.physicsBody.friction = 0.0;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}
-(void)playerPhysics:(SKSpriteNode *)sprite{
    sprite.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:CGPathCreateWithRoundedRect(CGRectMake((-sprite.size.width/2), (-sprite.size.height/2), sprite.size.width, sprite.size.height), 1, 1, NULL)];
    sprite.physicsBody.affectedByGravity = YES;
    sprite.physicsBody.allowsRotation = FALSE;
    sprite.physicsBody.restitution = 0.0;
    sprite.physicsBody.friction = 0.0;
    sprite.physicsBody.categoryBitMask =playerCategory;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}
-(void)enemyPhysics:(SKSpriteNode *)sprite{
    sprite.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:CGPathCreateWithRoundedRect(CGRectMake((-sprite.size.width/2), (-sprite.size.height/2), sprite.size.width, sprite.size.height), 1, 1, NULL)];
    sprite.physicsBody.affectedByGravity = YES;
    sprite.physicsBody.allowsRotation = FALSE;
    sprite.physicsBody.restitution = 0.0;
    sprite.physicsBody.friction = 0.0;
    sprite.physicsBody.categoryBitMask = enemyCategory;
    sprite.physicsBody.contactTestBitMask = playerCategory;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}
-(void)itemPhysics:(SKSpriteNode *)sprite{
    sprite.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:CGPathCreateWithRoundedRect(CGRectMake((-sprite.size.width/2), (-sprite.size.height/2), sprite.size.width, sprite.size.height), 1, 1, NULL)];
    sprite.physicsBody.affectedByGravity = YES;
    sprite.physicsBody.allowsRotation = FALSE;
    sprite.physicsBody.restitution = 0.0;
    sprite.physicsBody.friction = 0.0;
    sprite.physicsBody.categoryBitMask = itemCategory;
    sprite.physicsBody.contactTestBitMask = playerCategory;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}

-(void)specialTilePhysics:(SKSpriteNode *)sprite {
    sprite.physicsBody.categoryBitMask =tileCategory;
    sprite.physicsBody.contactTestBitMask = playerCategory;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}

-(void)object1:(SKPhysicsBody *) object1 didCollideWithObject2:(SKPhysicsBody *) object2 withPlayerStats:(PlayerStats *)bobbette inWorld:(SKNode *) world{
    
    if ( object1.categoryBitMask == playerCategory && object2.categoryBitMask == enemyCategory){
        [bobbette incrementHp:-1];
        [bobbette incrementMana:-1];
    }
    
    if ( object1.categoryBitMask == playerCategory && object2.categoryBitMask == itemCategory){
        
        [object2.node removeFromParent];
        
    }
    
}

@end
