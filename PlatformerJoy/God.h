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
#import "HpBar.h"
#import "EnemyData.h"
#import "PhysicsController.h"
#import "TileMap.h"
#import "MapData.h"
#import "EnemyMapData.h"

@interface God : NSObject

//Player
@property (strong, nonatomic) PlayerData *phillium;
@property (strong, nonatomic) PlayerStats *bobbette;
@property (strong, nonatomic) HpBar *chazzette;

//Enemy
@property (strong, nonatomic) EnemyData *takimoto;

//Physics
@property (strong, nonatomic) PhysicsController *billyphina;

//Tile Map
@property (strong, nonatomic) TileMap *bob;

//Level Data
@property (strong, nonatomic) MapData *ronald;
@property (strong, nonatomic) EnemyMapData *alphonsette;


/*~~~~~~~~~~~~~~~~~~~~~~~~*/


- (void) initializePeople;

- (void) initializeWorld: (SKNode *) world inScene: (SKScene *) scene;

- (void) updateScene: (SKScene *) scene;

- (void) beginMovement: (NSSet *) touches inScene: (SKScene *) scene;

- (void) endMovement: (NSSet *) touches inScene: (SKScene *) scene;

@end
