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
static const uint32_t enemyCategory  =0x1 <<2;
static const uint32_t itemCategory  =0x1 <<4;
static const uint32_t tileCategory   = 0x1 <<8;

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
    
    sprite.physicsBody.contactTestBitMask = enemyCategory | tileCategory | itemCategory;
    
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}
-(void)enemyPhysics:(SKSpriteNode *)sprite{
    sprite.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:CGPathCreateWithRoundedRect(CGRectMake((-sprite.size.width/2), (-sprite.size.height/2), sprite.size.width, sprite.size.height), 1, 1, NULL)];
    sprite.physicsBody.affectedByGravity = YES;
    sprite.physicsBody.allowsRotation = FALSE;
    sprite.physicsBody.restitution = 0.0;
    sprite.physicsBody.friction = 0.0;
    sprite.physicsBody.categoryBitMask = enemyCategory;
    sprite.physicsBody.collisionBitMask = playerCategory | enemyCategory | tileCategory;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}
-(void)itemPhysics:(SKSpriteNode *)sprite{
    sprite.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:CGPathCreateWithRoundedRect(CGRectMake((-sprite.size.width/2), (-sprite.size.height/2), sprite.size.width, sprite.size.height), 1, 1, NULL)];
    sprite.physicsBody.affectedByGravity = YES;
    sprite.physicsBody.allowsRotation = FALSE;
    sprite.physicsBody.restitution = 0.0;
    sprite.physicsBody.friction = 0.0;
    sprite.physicsBody.categoryBitMask = itemCategory;
    sprite.physicsBody.collisionBitMask = playerCategory | tileCategory;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}

-(void)specialTilePhysics:(SKSpriteNode *)sprite {
    sprite.physicsBody.categoryBitMask =tileCategory;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}

@end
