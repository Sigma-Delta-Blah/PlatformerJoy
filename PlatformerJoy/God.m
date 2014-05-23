//
//  God.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 11/25/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import "God.h"

@implementation God

- (void) initializePeople {
    
    //Player
    if (!_phillium) {
        _phillium = [[PlayerData alloc] init];
    }
    if (!_bobbette) {
        _bobbette = [[PlayerStats alloc] init];
    }
    if (!_chazzette) {
        _chazzette = [[HpBar alloc] init];
    }
    if (!_chazz) {
        _chazz = [[ManaBar alloc] init];
    }
    
    //Enemies
    if (!_takimoto) {
        _takimoto = [[EnemyData alloc] init];
    }
    
    //Items
    if (!_eggbert) {
        _eggbert = [[ItemData alloc] init];
    }
    
    //Physics
    if (!_billyphina) {
        _billyphina = [[PhysicsController alloc] init];
    }
    if (!_gillibert) {
        _gillibert = [[CollisionsController alloc] init];
    }
    
    //Tile Map
    if (!_bob) {
        _bob = [[TileMap alloc] init];
    }
    
    //Level Data
    if (!_ronald) {
        _ronald = [[MapData alloc] init];
    }
    if (!_alphonsette) {
        _alphonsette = [[EnemyMapData alloc] init];
    }
    if (!_jimothy) {
        _jimothy = [[ItemMapData alloc] init];
    }
    
    //BO-BO-BO-BO-BO-BO!!!!!!!!!!!!!!!!
    if (!_flobbyBobby) {
        _flobbyBobby = [[Thing alloc] init];
    }
    
}

- (void) initializeWorld: (SKNode *) world inScene: (SKScene *) scene {
    
    [_ronald createLevelOne: world withPhysics:_billyphina inMap: _bob];
    
    [_phillium createPlayer: world withPhysics:_billyphina];
    
    [_alphonsette createLevelOne:world inTileMap:_bob withPhysics:_billyphina withEnemyData:_takimoto inNode:world];
    [_jimothy createLevelOne:world inTileMap:_bob withPhysics:_billyphina withItemData:_eggbert inNode:world];
    
    [_bobbette setTotalHp:32];
    [_bobbette setHp:32];
    [_bobbette setTotalMana:32];
    [_bobbette setMana:32];
    [_bobbette setDef:32];
    
    [_chazzette createHpBar: scene];
    [_chazz createManaBar: scene];
    
}

- (void) updateScene: (SKScene *) scene : (SKNode *)  world{
    
    [_phillium movementPlayerUpdate: scene];
    
    [_phillium updateTimer:world];
    
    [_takimoto updateTheAI: _phillium.objSprite];
    
    [_bobbette damagePlayerUpdate];
    
    [_chazzette changeHp: [_bobbette getHp] outOf: [_bobbette getTotalHp]];
    [_chazz changeMana:[_bobbette getMana] outof:[_bobbette getTotalMana]];
    
    if ([_bobbette getHp] <= 0) {
        [_flobbyBobby smite: world];
    }
    
}

- (void) beginMovement: (NSSet *) touches inScene: (SKScene *) scene {
    
    [_phillium movementPlayerBegin: touches inScene: scene];
    
}

- (void) endMovement: (NSSet *) touches inScene: (SKScene *) scene {
    
    [_phillium movementPlayerEnd: touches inScene: scene];
    
}

-(void)didBeginContact:(SKPhysicsContact *) contact inWorld: (SKNode *) world{
    SKPhysicsBody *firstBody, *secondBody;
    firstBody = contact.bodyA;
    secondBody = contact.bodyB;
    [_gillibert object1:firstBody didCollideWithObject2:secondBody withPlayer: _phillium withPlayerStats:_bobbette inWorld: world];
    [_gillibert object1:secondBody didCollideWithObject2:firstBody withPlayer: _phillium withPlayerStats:_bobbette inWorld: world];
}

-(void)didEndContact:(SKPhysicsContact *)contact inWorld:(SKNode *)world {
    
    SKPhysicsBody *firstBody, *secondBody;
    firstBody = contact.bodyA;
    secondBody = contact.bodyB;
    [_gillibert object1:firstBody didEndCollideWithObject2:secondBody withPlayerStats:_bobbette inWorld: world];
    [_gillibert object1:secondBody didEndCollideWithObject2:firstBody withPlayerStats: _bobbette inWorld: world];
}

-(void) playerJump {
    [_phillium jump];
}

-(void)attackWorld:(SKNode *) world direction:(int)d{
    [_phillium attackInScene:world direction:d withPhysics:_billyphina];
}

@end
