//
//  MapData.h
//  PlatformerJoy
//
//  Created by Joseph Mooney on 1/27/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "TileMap.h"
#import "Tile.h"

@interface MapData : NSObject

@property (strong, nonatomic) TileMap *bob;

-(void) blankMap: (TileMap *) tileMap;

-(void) createLevelOne: (SKScene *) scene;

@end