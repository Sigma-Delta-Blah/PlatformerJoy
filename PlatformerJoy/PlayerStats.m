//
//  PlayerStats.m
//  PlatformerJoy
//
//  Created by block7 on 2/3/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "PlayerStats.h"

@implementation PlayerStats

int level = 0;
int xp = 0;

int hp = 0;
int atk = 0;
int def = 0;

+(void)incrementHp:(int)value {
    hp += value;
    NSLog(@"The hp value is: %d", hp);
}
+(void)setHp:(int)value {
    hp = value;
    NSLog(@"The hp value is: %d", hp);
}
+(int) getHp {
    return hp;
    NSLog(@"The hp value is: %d", hp);
}

+(void)incrementAtk:(int)value {
    atk += value;
    NSLog(@"The hp value is: %d", atk);
}
+(void)setAtk:(int)value {
    atk = value;
    NSLog(@"The hp value is: %d", atk);
}
+(int) getAtk {
    return atk;
    NSLog(@"The hp value is: %d", atk);
}

+(void)incrementDef:(int)value {
    def += value;
  NSLog(@"The hp value is: %d", def);
}
+(void)setDef:(int)value {
    def = value;
    NSLog(@"The hp value is: %d", def);
}
+(int)getDef {
    return def;
    NSLog(@"The hp value is: %d", def);
}

+(void)incrementLv:(int)value {
    level += value;
    NSLog(@"The hp value is: %d", level);
}
+(void)setLv:(int)value {
    level = value;
    NSLog(@"The hp value is: %d", level);
}
+(int)getLv {
    return level;
    NSLog(@"The hp value is: %d", level);
}

+(void)incrementXp:(int)value {
    xp += value;
    NSLog(@"The hp value is: %d", xp);
}
+(void)setXp:(int)value {
    xp = value;
    NSLog(@"The hp value is: %d", xp);
}
+(int)getXp {
    return xp;
    NSLog(@"The hp value is: %d", xp);
}
@end
