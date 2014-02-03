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
    sprite.physicsBody.affectedByGravity = NO;
    sprite.physicsBody.dynamic = NO;
    sprite.physicsBody.restitution = 0.0;
}
-(void)playerPhysics:(SKSpriteNode *)sprite{
    CGPoint location = CGPointMake(200, 200);
    sprite.position = location;
    sprite.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(25, 25)];
    sprite.physicsBody.affectedByGravity = YES;
    sprite.physicsBody.allowsRotation = FALSE;
    sprite.physicsBody.restitution = 0.01;
}

@end
