//
//  ManaBar.h
//  PlatformerJoy
//
//  Created by block7 on 4/17/14.
//  Copyright (c) 2014 WOE23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface ManaBar : NSObject

@property (strong, nonatomic)SKSpriteNode *manaBar;

-(void) createManaBar:(SKNode*)world;

-(void) changeMana:(int) manaCurrent outof: (int) manaTotal;

@end