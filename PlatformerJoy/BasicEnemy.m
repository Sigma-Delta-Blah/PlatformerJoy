//
//  BasicEnemy.m
//  PlatformerJoy
//
//  Created by block7 on 3/6/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//blue to red would look good though
// with purple in between
//and make it deplete fromleft to right. so backwards
// some games the bars deplete inwards. YEAH yeah yeah yeah
//too complex for us
//you dont know bullet hell till youve played joehou
//which is the best
//drawing
//charmander is the worst of ur drawings
//wheres chicoritas other arm...
//i think it has an arm growing off its back
//nope. that doesnt look right
//what did u base charmander on
//nope. bad picture
//ive seen those for other pokemon
//ive figured out y the gravity wont effect enemies

#import "BasicEnemy.h"

@implementation BasicEnemy

-(void)createWithLocationAndImage:(NSString *)fileName x:(int)x y:(int)y inScene: (SKNode *) scene withType:(int) type withPhysics:(PhysicsController *)physics{
    
    if (!_filheim) {
        _filheim = [[EnemyStats alloc] init];
    }
    
    [_filheim setLv:1];
    [_filheim setTotalHp:1];
    [_filheim setHp:1];
    [_filheim setAtk:16];
    [_filheim setDef:1];
    
    self.name = @"enemy";
    
    switch (type) {
        case 0:
            self.position = CGPointMake(x, y);
            self.size = CGSizeMake(16, 31);
            self.texture = [SKTexture textureWithImageNamed:fileName];
            break;
        case 1:
            break;
        case 2:
            break;
        default:
            break;
    }
    
    self.texture = [SKTexture textureWithImageNamed:@"enemy1.png"];
    
    [physics enemyPhysics:self];
    [scene addChild:self];
    
}

-(void) runAIWithPlayer: (SKSpriteNode *) player{
    if (self.position.x  > player.position.x  && self.position.x - player.position.x <= 200 && -125 <= self.position.y - player.position.y && self.position.y - player.position.y <= 125){
        self.physicsBody.velocity = CGVectorMake(-25, self.physicsBody.velocity.dy);
        self.texture = [SKTexture textureWithImageNamed:@"enemy2.png"];
    } else if (self.position.x < player.position.x && self.position.x - player.position.x >= -200 && -125 <= self.position.y - player.position.y && self.position.y - player.position.y <= 125){
        self.physicsBody.velocity =CGVectorMake(25, self.physicsBody.velocity.dy);
        self.texture = [SKTexture textureWithImageNamed:@"enemy1.png"];
    } else {
        self.physicsBody.velocity = CGVectorMake(0, self.physicsBody.velocity.dy);
    }
}

@end