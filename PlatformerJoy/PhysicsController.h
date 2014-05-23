//
//  PhysicsController.h
//  PlatformerJoy
//
//  Created by block7 on 12/13/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface PhysicsController : NSObject

-(void)tilePhysics:(SKSpriteNode *) sprite;
-(void)playerPhysics:(SKSpriteNode *) sprite;
-(void)enemyPhysics: (SKSpriteNode *) sprite;
-(void)itemPhysics: (SKSpriteNode *) sprite;
-(void)fallingTilePhysics:(SKSpriteNode *) sprite;
-(void)weaponPhysics:(SKSpriteNode *) sprite;

@end
