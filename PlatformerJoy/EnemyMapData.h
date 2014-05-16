//
//  EnemyMapData.h
//  PlatformerJoy
//
//  Created by Joseph Mooney on 3/7/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "TileMap.h"

@interface EnemyMapData : NSObject

-(void) createLevel: (SKNode *) scene withEnemies: (NSString *) enemyTxt inTileMap: (TileMap *) tileM;

-(void) createLevelOne: (SKNode *) scene;

@end
