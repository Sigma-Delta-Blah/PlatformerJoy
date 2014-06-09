//
//  Spell.h
//  PlatformerJoy
//
//  Created by block7 on 5/16/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Spell : NSObject

@property(strong, nonatomic)NSString *filepath;

@property(strong, nonatomic)NSDictionary *spellsDict;

@property(strong, nonatomic)
NSDictionary *currentSpell;

@property(strong, nonatomic) NSDictionary *spellEffects;

-(void)readSpells;
-(void)getSpell:(NSNumber*)spellNo;
-(void)castSpell;

@end
