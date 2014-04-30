//
//  BasicEnemy.h
//  PlatformerJoy
//
//  Created by block7 on 3/6/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "PhysicsController.h"
@interface BasicEnemy : SKSpriteNode

-(void)createWithLocationAndImage:(NSString *)fileName x:(int) x y:(int) y inScene: (SKNode *) scene withType:(int) type withPhysics: (PhysicsController *) physics;

-(void) runAIWithPlayer: (SKSpriteNode *) player;
@end