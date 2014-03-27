//
//  God.h
//  PlatformerJoy
//
//  Created by Joseph Mooney on 11/25/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerData.h"
#import "PlayerStats.h"
#import "PhysicsController.h"
#import "TileMap.h"
#import "MapData.h"
#import "EnemyMapData.h"

@interface God : NSObject

//Player
@property (strong, nonatomic) PlayerData *phillium;
@property (strong, nonatomic) PlayerStats *bobbette;

//Physics
@property (strong, nonatomic) PhysicsController *billyphina;

//Tile Map
@property (strong, nonatomic) TileMap *bob;

//Level Data
//Map Data
@property (strong, nonatomic) MapData *ronald;
//Enemy Data
@property (strong, nonatomic) EnemyMapData *alphonsette;

- (void) initializePeople;

- (void) initializeWorld: (SKNode *) world;

- (void) beginMovement: (NSSet *) touches inScene: (SKNode *) world;
- (void) endMovement: (NSSet *) touches inScene: (SKNode *) world;
- (void) updateMovement: (SKNode *) world;

@end
