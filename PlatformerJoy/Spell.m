//
//  Spell.m
//  PlatformerJoy
//
//  Created by block7 on 5/16/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "Spell.h"

@implementation Spell

-(void)readSpells {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Spells" ofType:@"plist"];
    
    NSLog(@"Running readSpells!");
    
    _spellsDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"Spells.plist read!");
    if(_spellsDict==NULL) {
        NSLog(@"spellsdict is null!");
    }
}

-(void) getSpell:(NSNumber*)spellNo{
    NSLog(@"spellNo to get is %@", spellNo);
    
    for(id key in _spellsDict) {
        NSDictionary *stuff = [_spellsDict objectForKey:key];
        NSNumber *number = [stuff objectForKey:@"Spell ID"];
        NSLog(@"%@",number);
        if(number == spellNo) {
            _currentSpell = stuff;
            NSLog(@"%@",[stuff objectForKey:@"Name"]);
            self.castSpell;
        }
    }
}

-(void)castSpell {
    _spellEffects = [_currentSpell objectForKey:@"Effect"];
    NSLog(@"Casting %@",[_currentSpell objectForKey:@"Name"]);
    
    NSNumber *healamt = [_spellEffects objectForKey:@"Health Change"];
}

@end
