//
//  EnemyStats.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 5/5/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "EnemyStats.h"

@implementation EnemyStats

int levelE = 0;

int hpE = 0;
int totalHpE = 0;
int atkE = 0;
int defE = 0;

-(void)setTotalHp:(int)value {
    totalHpE = value;
    NSLog(@"The total hp is: %d", totalHpE);
}
-(void)incrementTotalHp:(int)value {
    totalHpE += value;
    NSLog(@"The total hp is: %d", totalHpE);
}
-(int)getTotalHp {
    return totalHpE;
}

-(void)incrementHp:(int)value {
    if(hpE+value<0) {
        NSLog(@"The hp value cannot go below zero!");
    }
    else if(hpE+value <= totalHpE) {
        hpE += value;
        NSLog(@"The hp value is: %d", hpE);
    }
    else {
        NSLog(@"The hp value cannot exceed the hp cap! The current HP cap is %d", totalHpE);
    }
    
}
-(void)setHp:(int)value {
    hpE = value;
    NSLog(@"The hp value is: %d", hpE);
}
-(int) getHp {
    return hpE;
    NSLog(@"The hp value is: %d", hpE);
}

-(void)incrementAtk:(int)value {
    atkE += value;
    NSLog(@"The atk value is: %d", atkE);
}
-(void)setAtk:(int)value {
    atkE = value;
    NSLog(@"The atk value is: %d", atkE);
}
-(int) getAtk {
    return atkE;
    NSLog(@"The atk value is: %d", atkE);
}

-(void)incrementDef:(int)value {
    defE += value;
    NSLog(@"The def value is: %d", defE);
}
-(void)setDef:(int)value {
    defE = value;
    NSLog(@"The def value is: %d", defE);
}
-(int)getDef {
    return defE;
    NSLog(@"The def value is: %d", defE);
}

-(void)incrementLv:(int)value {
    levelE += value;
    NSLog(@"The lv value is: %d", levelE);
}
-(void)setLv:(int)value {
    levelE = value;
    NSLog(@"The lv value is: %d", levelE);
}
-(int)getLv {
    return levelE;
    NSLog(@"The lv value is: %d", levelE);
}

@end
