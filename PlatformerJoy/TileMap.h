//
//  TileMap.h
//  PlatformerJoy
//
//  Created by Joseph Mooney on 11/25/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Tile.h"

@interface TileMap : NSObject

@property NSMutableArray *tiles;

-(void) setMapofWidth:(int) xValue andHeight:(int) yValue;

-(Tile *) getTileAtX:(int) xValue andY:(int) yValue;

@end
