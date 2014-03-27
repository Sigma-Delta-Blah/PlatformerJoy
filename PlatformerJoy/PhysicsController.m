//
//  PhysicsController.m
//  PlatformerJoy
//
//  Created by block7 on 12/13/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import "PhysicsController.h"

@implementation PhysicsController


-(void)tilePhysics:(SKSpriteNode *) sprite{
    
    sprite.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(16, 16)];
    sprite.physicsBody.dynamic = NO;
    sprite.physicsBody.restitution = 0.0;
    sprite.physicsBody.friction = 0.0;
}
-(void)playerPhysics:(SKSpriteNode *)sprite{
    sprite.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:CGPathCreateWithRoundedRect(CGRectMake((-sprite.size.width/2), (-sprite.size.height/2), sprite.size.width, sprite.size.height), 1, 1, NULL)/*:CGSizeMake(16, 16)*/];
    sprite.physicsBody.affectedByGravity = YES;
    sprite.physicsBody.allowsRotation = FALSE;
    sprite.physicsBody.restitution = 0.0;
    sprite.physicsBody.friction = 0.0;
}

@end
