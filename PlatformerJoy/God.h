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
#import "ManaBar.h"
#import "EnemyData.h"
#import "ItemData.h"
#import "PhysicsController.h"
#import "CollisionsController.h"
#import "TileMap.h"
#import "MapData.h"
#import "EnemyMapData.h"
#import "ItemMapData.h"
#import "Thing.h"

@interface God : NSObject

//Player
@property (strong, nonatomic) PlayerData *phillium;
@property (strong, nonatomic) PlayerStats *bobbette;
@property (strong, nonatomic) HpBar *chazzette;
@property (strong, nonatomic) ManaBar *chazz;

//Enemies
@property (strong, nonatomic) EnemyData *takimoto;

//Items
@property (strong, nonatomic) ItemData * eggbert;

//Physics
@property (strong, nonatomic) PhysicsController *billyphina;
@property (strong, nonatomic) CollisionsController *gillibert;

//Tile Map
@property (strong, nonatomic) TileMap *bob;

//Level Data
@property (strong, nonatomic) MapData *ronald;
@property (strong, nonatomic) EnemyMapData *alphonsette;
@property (strong, nonatomic) ItemMapData * jimothy;

//BO-BO-BO-BO-BO-BO!!!!!!!!!!!!!!!!
@property (strong, nonatomic) Thing *flobbyBobby; //He brings death in his wake; he spreads doom and corruption and famine across the lands...  Fear the flobbyBobby; fear him...


/*~~~~~~~~~~~~~~~~~~~~~~~~*/


- (void) initializePeople;

- (void) initializeWorld: (SKNode *) world inScene: (SKScene *) scene;

- (void) updateScene: (SKScene *) scene : (SKNode *) world;

- (void) beginMovement: (NSSet *) touches inScene: (SKScene *) scene;

- (void) endMovement: (NSSet *) touches inScene: (SKScene *) scene;

-(void)didBeginContact:(SKPhysicsContact *) contact inWorld: (SKNode *) world;

-(void)didEndContact:(SKPhysicsContact *)contact inWorld:(SKNode *) world;

-(void) playerJump;

-(void)attackWorld:(SKNode *) world direction:(int)d;

@end
