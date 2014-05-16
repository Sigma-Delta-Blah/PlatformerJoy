//
//  EnemyStats.h
//  PlatformerJoy
//
//  Created by Joseph Mooney on 5/5/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EnemyStats : NSObject

-(void)setTotalHp:(int)value;
-(void)incrementTotalHp:(int)value;
-(int)getTotalHp;

-(void)incrementHp:(int)value;
-(void)setHp:(int)value;
-(int) getHp;

-(void)incrementAtk:(int)value;
-(void)setAtk:(int)value;
-(int) getAtk;

-(void)incrementDef:(int)value;
-(void)setDef:(int)value;
-(int)getDef;

-(void)incrementLv:(int)value;
-(void)setLv:(int)value;
-(int)getLv;

@end
