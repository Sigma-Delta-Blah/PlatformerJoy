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
#import "PlayerData.h"

@interface CollisionsController : NSObject

@property (strong, nonatomic) BasicEnemy *tester;

-(void)object1:(SKPhysicsBody *) object1 didCollideWithObject2:(SKPhysicsBody *) object2 withPlayer: (PlayerData *) player withPlayerStats:(PlayerStats *)bobbette inWorld:(SKNode *) world;

-(void)object1:(SKPhysicsBody *) object1 didEndCollideWithObject2:(SKPhysicsBody *) object2 withPlayerStats:(PlayerStats *)bobbette inWorld:(SKNode *) world;

@end
