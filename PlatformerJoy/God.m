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

    if (!_phillium) {
        _phillium = [[PlayerData alloc] init];
    }
    if (!_bobbette) {
        _bobbette = [[PlayerStats alloc] init];
    }
    
    if (!_billyphina) {
        _billyphina = [[PhysicsController alloc] init];
    }
    
    if (!_bob) {
        _bob = [[TileMap alloc] init];
    }
    
    if (!_ronald) {
        _ronald = [[MapData alloc] init];
    }
    if (!_alphonsette) {
        _alphonsette = [[EnemyMapData alloc] init];
    }
    
}

- (void) initializeWorld: (SKNode *) world {
    
    [_ronald createLevelOne: world withPhysics:_billyphina inMap: _bob];
    
    [_phillium createPlayer: world withPhysics:_billyphina];
    
}

- (void) beginMovement: (NSSet *) touches inScene: (SKNode *) scene {
    [_phillium movementPlayerBegin: touches inScene: scene];
}
- (void) endMovement: (NSSet *) touches inScene: (SKNode *) scene {
    [_phillium movementPlayerEnd: touches inScene: scene];
}
- (void) updateMovement: (SKNode *) scene {
    [_phillium movementPlayerUpdate: scene];
}

@end
