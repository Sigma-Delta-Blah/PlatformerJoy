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
    
    //Enemy
    if (!_takimoto) {
        _takimoto = [[EnemyData alloc] init];
    }
    
    //Physics
    if (!_billyphina) {
        _billyphina = [[PhysicsController alloc] init];
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
    
}

- (void) initializeWorld: (SKNode *) world inScene: (SKScene *) scene {
    
    [_ronald createLevelOne: world withPhysics:_billyphina inMap: _bob];
    
    [_phillium createPlayer: world withPhysics:_billyphina];
    
    [_alphonsette createLevelOne:world inTileMap:_bob withPhysics:_billyphina withEnemyData:_takimoto inNode:world];
    
    [_bobbette setTotalHp:32];
    [_bobbette setHp:32];
    
    [_chazzette createHpBar: scene];
    
}

- (void) updateScene: (SKScene *) scene {
    
    [_phillium movementPlayerUpdate: scene];
    
    [_takimoto updateTheAI: _phillium.objSprite];
    
    [_chazzette changeHp: [_bobbette getHp] outOf: [_bobbette getTotalHp]];
    
}

- (void) beginMovement: (NSSet *) touches inScene: (SKScene *) scene {
    
    [_phillium movementPlayerBegin: touches inScene: scene];
    
}

- (void) endMovement: (NSSet *) touches inScene: (SKScene *) scene {
    
    [_phillium movementPlayerEnd: touches inScene: scene];
    
}

-(void)didBeginContact:(SKPhysicsContact *)contact inScene:(SKScene *)scene{
    
}

-(void)didEndContact:(SKPhysicsContact *)contact inScene:(SKScene *)scene{
    
}

-(void)didBeginContact:(SKPhysicsContact *) contact{
    SKPhysicsBody *firstBody, *secondBody;
    firstBody = contact.bodyA;
    secondBody = contact.bodyB;
    //NSLog(@"contact detected between %d and %d ",firstBody.categoryBitMask , secondBody.categoryBitMask);
    [_billyphina player:firstBody didCollideWithEnemy:secondBody withPlayerStats:_bobbette];
}

@end
