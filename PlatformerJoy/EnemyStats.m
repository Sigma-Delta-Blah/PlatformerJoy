//
//  EnemyStats.m
//  PlatformerJoy
//
//  Created by block7 on 4/11/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "EnemyStats.h"

@implementation EnemyStats

int level = 0;

int hp = 0;
int totalHp = 0;
int atk = 0;
int def = 0;

-(void)setTotalHp:(int)value {
    totalHp = value;
    NSLog(@"The total hp is: %d", totalHp);
}
-(void)incrementTotalHp:(int)value {
    totalHp += value;
    NSLog(@"The total hp is: %d", totalHp);
}
-(int)getTotalHp {
    return totalHp;
}

-(void)incrementHp:(int)value {
    if(hp+value<0) {
        NSLog(@"The hp value cannot go below zero!");
    }
    else if(hp+value <= totalHp) {
        hp += value;
        NSLog(@"The hp value is: %d", hp);
    }
    else {
        NSLog(@"The hp value cannot exceed the hp cap! The current HP cap is %d", totalHp);
    }
    
}
-(void)setHp:(int)value {
    hp = value;
    NSLog(@"The hp value is: %d", hp);
}
-(int) getHp {
    return hp;
    NSLog(@"The hp value is: %d", hp);
}

-(void)incrementAtk:(int)value {
    atk += value;
    NSLog(@"The atk value is: %d", atk);
}
-(void)setAtk:(int)value {
    atk = value;
    NSLog(@"The atk value is: %d", atk);
}
-(int) getAtk {
    return atk;
    NSLog(@"The atk value is: %d", atk);
}

-(void)incrementDef:(int)value {
    def += value;
    NSLog(@"The def value is: %d", def);
}
-(void)setDef:(int)value {
    def = value;
    NSLog(@"The def value is: %d", def);
}
-(int)getDef {
    return def;
    NSLog(@"The def value is: %d", def);
}

-(void)incrementLv:(int)value {
    level += value;
    NSLog(@"The lv value is: %d", level);
}
-(void)setLv:(int)value {
    level = value;
    NSLog(@"The lv value is: %d", level);
}
-(int)getLv {
    return level;
    NSLog(@"The lv value is: %d", level);
}

@end
