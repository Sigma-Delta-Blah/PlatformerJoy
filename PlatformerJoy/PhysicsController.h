//
//  PhysicsController.h
//  PlatformerJoy
//
//  Created by block7 on 12/13/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "PlayerStats.h"

@interface PhysicsController : NSObject

-(void)tilePhysics:(SKSpriteNode *) sprite;
-(void)playerPhysics:(SKSpriteNode *) sprite;
-(void)enemyPhysics: (SKSpriteNode *) sprite;

-(void)player:(SKNode *) player didCollideWithEnemy:(SKNode *) enemy withPlayerStats: (PlayerStats *) bobbette;

@end
