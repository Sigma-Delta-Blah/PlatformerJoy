//
//  HpBar.h
//  PlatformerJoy
//
//  Created by block7 on 3/7/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface HpBar : NSObject

@property (strong, nonatomic)SKSpriteNode *hpBar;

-(void) createHpBar:(SKNode *) world;

-(void) changeHp:(int) hpCurrent outOf: (int) hpTotal;

@end