//
//  CollisionsController.h
//  PlatformerJoy
//
//  Created by Joseph Mooney on 5/15/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "PlayerStats.h"
#import "BasicEnemy.h"

@interface CollisionsController : NSObject

-(void)object1:(SKPhysicsBody *) object1 didCollideWithObject2:(SKPhysicsBody *) object2 withPlayerStats:(PlayerStats *)bobbette withEnemy:(BasicEnemy *) enemy inWorld:(SKNode *) world;

@end
