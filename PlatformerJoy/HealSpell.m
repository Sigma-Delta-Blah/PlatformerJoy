//
//  HealSpell.m
//  PlatformerJoy
//
//  Created by block7 on 5/6/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "HealSpell.h"

@implementation HealSpell

NSString *name = @"Heal";
NSString *description = @"Generic Healing Spell";
BOOL *unlocked = YES;

NSInteger *cooldown = 3;
-(void)cast:(PlayerStats*)stats{
    if(cooldown == 0) {
        [stats incrementHp:-3];
    }
}

@end
