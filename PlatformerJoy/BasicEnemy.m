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

-(void)createWithLevel: (int) level X:(int)x Y:(int)y inScene: (SKNode *) scene withType:(int) type withPhysics:(PhysicsController *)physics{
    
    self.timer = -1;
    self.KBSpeed = 0;
    
    if (!_filheim) {
        _filheim = [[EnemyStats alloc] init];
    }
    
    self.name = @"enemy";
    
    [_filheim setLv:level];
    
    switch (type) {
        case 0:
            self.position = CGPointMake(x, y);
            self.size = CGSizeMake(16, 31);
            self.texture = [SKTexture textureWithImageNamed:@"Enemy - Basic_1.png"];
            [_filheim setTotalHp:level];
            [_filheim setHp:level];
            [_filheim setAtk:level];
            [_filheim setDef:level];
            [_filheim setSpd:25];
            break;
        case 1:
            break;
        case 2:
            break;
        default:
            break;
    }
    
    [physics enemyPhysics:self];
    [scene addChild:self];
    
}

-(void) runAIWithPlayer: (SKSpriteNode *) player{
    if (self.timer < 0) {
        if (self.position.x  > player.position.x  && self.position.x - player.position.x <= 200 && -125 <= self.position.y - player.position.y && self.position.y - player.position.y <= 125){
            self.physicsBody.velocity = CGVectorMake(-[_filheim getSpd], self.physicsBody.velocity.dy);
            self.texture = [SKTexture textureWithImageNamed:@"enemy2.png"];
        } else if (self.position.x < player.position.x && self.position.x - player.position.x >= -200 && -125 <= self.position.y - player.position.y && self.position.y - player.position.y <= 125){
            self.physicsBody.velocity =CGVectorMake([_filheim getSpd], self.physicsBody.velocity.dy);
            self.texture = [SKTexture textureWithImageNamed:@"enemy1.png"];
        } else {
            self.physicsBody.velocity = CGVectorMake(0, self.physicsBody.velocity.dy);
        }
    } else {
        
        self.physicsBody.velocity = CGVectorMake(self.KBSpeed, self.physicsBody.velocity.dy);
        self.timer -= 1;
        
    }
}

-(void) knockbackWithPlayer:(SKSpriteNode *)player {
    
    if (self.position.x > player.position.x) {
        
        self.KBSpeed = [_filheim getSpd]*6;
        
    } else if (self.position.x < player.position.x) {
        
        self.KBSpeed = -[_filheim getSpd]*6;
        
    }
    
    self.timer = 4;
    
}

-(void) death {
    if ([_filheim getHp] <= 0) {
        self.removeFromParent;
    }
}

@end