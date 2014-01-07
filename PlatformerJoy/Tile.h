//
//  Tile.h
//  PlatformerJoy
//
//  Created by block7 on 12/13/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Tile : SKSpriteNode

@property(nonatomic) NSInteger *function; //What the tile does (what type of tile it is)

- (void)setFunction: (NSInteger *)type;
- (NSInteger)getFunction;

@end
