//
//  ItemMapData.h
//  PlatformerJoy
//
//  Created by Joseph Mooney on 5/6/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "TileMap.h"
#import "ItemData.h"

@interface ItemMapData : NSObject

-(void) createLevel: (SKNode *) scene withItems: (NSString *) itemTxt inTileMap: (TileMap *) tileM withPhysics: (PhysicsController *) physics withItemData: (ItemData *) iData inNode: (SKNode *) world;

-(void) createLevelOne: (SKNode *) scene inTileMap:(TileMap *) tileM withPhysics:(PhysicsController *) physics withItemData:(ItemData *) iData inNode: (SKNode *) world;

@end
