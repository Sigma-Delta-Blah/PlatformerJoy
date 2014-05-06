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

int enemyLevel = 0;
int enemyXp = 0;

int enemyHp = 0;
int enemyTotalHp = 0;
int enemyAtk = 0;
int enemyDef = 0;

-(void)createWithLocationAndImage:(NSString *)fileName x:(int)x y:(int)y inScene: (SKNode *) scene withType:(int) type withPhysics:(PhysicsController *)physics{
    
    enemyLevel = 0;
    enemyXp = 0;
    
    enemyHp = 0;
    enemyTotalHp = 0;
    enemyAtk = 0;
    enemyDef = 0;
    
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
    
    [physics enemyPhysics:self];
    [scene addChild:self];
    
}

-(void) runAIWithPlayer: (SKSpriteNode *) player{
    if (self.position.x  > player.position.x){
        self.physicsBody.velocity = CGVectorMake(-10, 0);
    } else if (self.position.x < player.position.x){
        self.physicsBody.velocity =CGVectorMake(10, 0);
    } else {
        self.physicsBody.velocity = CGVectorMake(0, 0);
    }
}

+(void)setTotalHp:(int)value {
    enemyTotalHp = value;
    NSLog(@"The total hp is: %d", enemyTotalHp);
}
+(void)incrementTotalHp:(int)value {
    enemyTotalHp += value;
    NSLog(@"The total hp is: %d", enemyTotalHp);
}
+(int)getTotalHp {
    return enemyTotalHp;
}

+(void)incrementHp:(int)value {
    if(enemyHp+value<0) {
        NSLog(@"The hp value cannot go below zero!");
    }
    else if(enemyHp+value <= enemyTotalHp) {
        enemyHp += value;
        NSLog(@"The hp value is: %d", enemyHp);
    }
    else {
        NSLog(@"The hp value cannot exceed the hp cap! The current HP cap is %d", enemyTotalHp);
    }
    
}
+(void)setHp:(int)value {
    enemyHp = value;
    NSLog(@"The hp value is: %d", enemyHp);
}
+(int) getHp {
    return enemyHp;
    NSLog(@"The hp value is: %d", enemyHp);
}

+(void)incrementAtk:(int)value {
    enemyAtk += value;
    NSLog(@"The atk value is: %d", enemyAtk);
}
+(void)setAtk:(int)value {
    enemyAtk = value;
    NSLog(@"The atk value is: %d", enemyAtk);
}
+(int) getAtk {
    return enemyAtk;
    NSLog(@"The atk value is: %d", enemyAtk);
}

+(void)incrementDef:(int)value {
    enemyDef += value;
    NSLog(@"The def value is: %d", enemyDef);
}
+(void)setDef:(int)value {
    enemyDef = value;
    NSLog(@"The def value is: %d", enemyDef);
}
+(int)getDef {
    return enemyDef;
    NSLog(@"The def value is: %d", enemyDef);
}

+(void)incrementLv:(int)value {
    enemyLevel += value;
    NSLog(@"The lv value is: %d", enemyLevel);
}
+(void)setLv:(int)value {
    enemyLevel = value;
    NSLog(@"The lv value is: %d", enemyLevel);
}
+(int)getLv {
    return enemyLevel;
    NSLog(@"The lv value is: %d", enemyLevel);
}

+(void)incrementXp:(int)value {
    enemyXp += value;
    NSLog(@"The xp value is: %d", enemyXp);
}
+(void)setXp:(int)value {
    enemyXp = value;
    NSLog(@"The xp value is: %d", enemyXp);
}
+(int)getXp {
    return enemyXp;
    NSLog(@"The xp value is: %d", enemyXp);
}

@end