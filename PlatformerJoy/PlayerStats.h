//
//  PlayerStats.h
//  PlatformerJoy
//
//  Created by block7 on 2/3/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerStats : NSObject

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

@end
