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
static const uint32_t fallingTileCategory   = 0x1 <<8;
static const uint32_t weaponCategory = 0x1 <<16;

-(void)tilePhysics:(SKSpriteNode *) sprite{
    
    sprite.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(16, 16)];
    sprite.physicsBody.dynamic = NO;
    sprite.physicsBody.affectedByGravity = NO;
    sprite.physicsBody.restitution = 0.0;
    sprite.physicsBody.friction = 0.0;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
    sprite.physicsBody.collisionBitMask = enemyCategory | playerCategory | itemCategory | fallingTileCategory;
}
-(void)playerPhysics:(SKSpriteNode *)sprite{
    
    sprite.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:CGPathCreateWithRoundedRect(CGRectMake((-sprite.size.width/2), (-sprite.size.height/2), sprite.size.width, sprite.size.height), 1, 1, NULL)];
    sprite.physicsBody.affectedByGravity = YES;
    sprite.physicsBody.allowsRotation = FALSE;
    sprite.physicsBody.restitution = 0.0;
    sprite.physicsBody.friction = 0.0;
    sprite.physicsBody.categoryBitMask =playerCategory;
    sprite.physicsBody.contactTestBitMask = enemyCategory | fallingTileCategory | itemCategory;
    sprite.physicsBody.collisionBitMask = enemyCategory | fallingTileCategory | itemCategory;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}
-(void)enemyPhysics:(SKSpriteNode *)sprite{
    sprite.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:CGPathCreateWithRoundedRect(CGRectMake((-sprite.size.width/2), (-sprite.size.height/2), sprite.size.width, sprite.size.height), 1, 1, NULL)];
    sprite.physicsBody.affectedByGravity = YES;
    sprite.physicsBody.allowsRotation = FALSE;
    sprite.physicsBody.restitution = 0.0;
    sprite.physicsBody.friction = 0.0;
    sprite.physicsBody.categoryBitMask = enemyCategory;
    sprite.physicsBody.contactTestBitMask = playerCategory | weaponCategory;
    sprite.physicsBody.collisionBitMask = playerCategory | enemyCategory | fallingTileCategory;
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
    sprite.physicsBody.collisionBitMask = playerCategory | fallingTileCategory;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}

-(void)fallingTilePhysics:(SKSpriteNode *)sprite {
    sprite.physicsBody.categoryBitMask = fallingTileCategory;
    sprite.physicsBody.contactTestBitMask = playerCategory;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}

-(void)weaponPhysics:(SKSpriteNode *) sprite{
    sprite.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(16, 3)];
    sprite.physicsBody.affectedByGravity = NO;
    sprite.physicsBody.allowsRotation = FALSE;
    sprite.physicsBody.restitution = 0.0;
    sprite.physicsBody.friction = 0.0;
    sprite.physicsBody.categoryBitMask = weaponCategory;
    sprite.physicsBody.contactTestBitMask = enemyCategory;
    sprite.physicsBody.collisionBitMask = weaponCategory;
    sprite.physicsBody.usesPreciseCollisionDetection = YES;
}

@end
