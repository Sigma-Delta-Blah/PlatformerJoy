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

<<<<<<< HEAD
-(void)createWithLocationAndImage:(NSString *)fileName x:(int) x y:(int) y inScene: (SKNode *) scene withType:(int) type;
=======
-(void)createWithLocationAndImage:(NSString *)fileName x:(int) x y:(int) y inScene: (SKNode *) scene withType:(int) type withPhysics: (PhysicsController *) physics;
>>>>>>> FETCH_HEAD

-(void) runAIWithPlayer: (SKSpriteNode *) player;
<<<<<<< HEAD
=======

+(void)setTotalHp:(int)value;
+(void)incrementTotalHp:(int)value;
+(int)getTotalHp;
+(void)incrementHp:(int)value;
+(void)setHp:(int)value;
+(int) getHp;
+(void)incrementAtk:(int)value;
+(void)setAtk:(int)value;
+(int) getAtk;
+(void)incrementDef:(int)value;
+(void)setDef:(int)value;
+(int)getDef;
+(void)incrementLv:(int)value;
+(void)setLv:(int)value;
+(int)getLv;
+(void)incrementXp:(int)value;
+(void)setXp:(int)value;
+(int)getXp;

>>>>>>> FETCH_HEAD
@end