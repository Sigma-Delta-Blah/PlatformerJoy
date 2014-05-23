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
#import "PhysicsController.h"

@interface MapData : NSObject

@property (strong, nonatomic) SKSpriteNode * background;

-(void) blankMap: (SKNode *) scene inMap: (TileMap *) map;

-(void) createLevel: (SKNode *) scene withFunction: (NSString *) functionTxt withTexture: (NSString *) textureTxt withBackground: (NSString *) backgroundTxt withPhysics: (PhysicsController *) physics inMap: (TileMap *) map;

-(void) createLevelOne: (SKNode *) scene withPhysics: (PhysicsController *) physics inMap: (TileMap *) map;

@end