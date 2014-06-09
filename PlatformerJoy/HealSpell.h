//
//  HealSpell.h
//  PlatformerJoy
//
//  Created by block7 on 5/6/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "Spell.h"
#import "PlayerStats.h"

@interface HealSpell : Spell

@property(strong, nonatomic)NSString *name;
@property(strong, nonatomic)NSString *description;
@property(nonatomic)BOOL *unlocked;

@property(nonatomic)NSInteger *cooldown;
@property(nonatomic)NSInteger *cdTimeLeft;

@property(nonatomic)NSInteger *manaConsumed;
@property(nonatomic)NSInteger *hpConsumed;

-(void)cast:stats;
@end
