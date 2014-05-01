//
//  EnemyData.h
//  PlatformerJoy
//
//  Created by block7 on 3/4/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <SpriteKit/SpriteKit.h>
#import "PhysicsController.h"
#import "BasicEnemy.h"


@interface EnemyData : NSObject
@property (strong, nonatomic) NSMutableArray *enemyList;

<<<<<<< HEAD
-(void)addEnemiesToWorld:(int) numberToCreate inNose:(SKNode *) world;
-(void)updateTheAI: (SKSpriteNode *) player;


@end
=======
-(void)addEnemiesToWorld:(int) numberToCreate inNose:(SKNode *) world withPhysics: (PhysicsController *) physics;
-(void)updateTheAI: (SKSpriteNode *) player;


@end
>>>>>>> FETCH_HEAD
