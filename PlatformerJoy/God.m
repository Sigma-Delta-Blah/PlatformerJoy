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
    
    //BO-BO-BO-BO-BO-BO!!!!!!!!!!!!!!!!
    if (!_flobbyBobby) {
        _flobbyBobby = [[Thing alloc] init];
    }
    
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
    
    //Enemy
    if (!_takimoto) {
        _takimoto = [[EnemyData alloc] init];
    }
    
    //Item
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
    
}

- (void) initializeWorld: (SKNode *) world inScene: (SKScene *) scene {
    
    [_ronald createLevelOne: world withPhysics:_billyphina inMap: _bob];
    
    [_phillium createPlayer: world withPhysics:_billyphina];
    
<<<<<<< HEAD
    [_alphonsette createLevelOne:world inTileMap:_bob withPhysics:_billyphina withEnemyData:_takimoto inNode:world];
    [_jimothy createLevelOne:world inTileMap:_bob withPhysics:_billyphina withItemData:_eggbert inNode:world];
=======
    [_takimoto addEnemiesToWorld: 2 inNose: world withPhysics: _billyphina];
>>>>>>> Keith
    
    [_bobbette setTotalHp:32];
    [_bobbette setHp:32];
    [_bobbette setTotalMana:32];
    [_bobbette setMana:32];
    
    [_chazzette createHpBar: scene];
    [_chazz createManaBar: scene];
    
}

- (void) updateScene: (SKScene *) scene : (SKNode *)  world{
    
    [_phillium movementPlayerUpdate: scene];
    
    [_takimoto updateTheAI: _phillium.objSprite];
    
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

<<<<<<< HEAD
=======
-(void)didBeginContact:(SKPhysicsContact *)contact inScene:(SKScene *)scene{
    
}

-(void)didEndContact:(SKPhysicsContact *)contact inScene:(SKScene *)scene{
    
}

-(void)didBeginContact:(SKPhysicsContact *) contact inWorld: (SKNode *) world{
    SKPhysicsBody *firstBody, *secondBody;
    firstBody = contact.bodyA;
    secondBody = contact.bodyB;
    //NSLog(@"contact detected between %d and %d ",firstBody.categoryBitMask , secondBody.categoryBitMask);
    [_gillibert object1:firstBody didCollideWithObject2:secondBody withPlayerStats:_bobbette withEnemy:secondBody.node inWorld: world];
}

-(void) playerJump {
    [_phillium jump];
}

<<<<<<< HEAD
=======
+(void) smite: (SKScene *) scene {
    [scene removeAllChildren];
    SKSpriteNode *gameOver = [[SKSpriteNode alloc] initWithImageNamed:@"gameover.png"];
    [scene addChild:gameOver];
}

>>>>>>> FETCH_HEAD
>>>>>>> Keith
@end
