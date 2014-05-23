//
//  EnemyData.m
//  PlatformerJoy
//
//  Created by block7 on 3/4/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "EnemyData.h"

@implementation EnemyData

-(void)addEnemiesToWorld:(int) numberToCreate inNose:(SKNode *) world withPhysics:(PhysicsController *)physics atX: (int[]) xPos atY: (int[]) yPos{

    if(!self.enemyList){
        self.enemyList = [[NSMutableArray alloc] init];
    }

    for (int i = 0; i < numberToCreate; i++) {
        NSLog(@"%d, %d, %d", i, xPos[i], yPos[i]);
    }

    BasicEnemy *tempList[numberToCreate];
    //[_enemyList removeAllObjects];
    for (int i = 0; i < numberToCreate; i++){
        tempList[i] = [BasicEnemy spriteNodeWithImageNamed:@"Enemy - Basic_1.png"];
        [_enemyList addObject:tempList[i]];
        [_enemyList[i] createWithLevel: 1 X: xPos[i] Y: yPos[i] inScene:world withType:0 withPhysics:physics];
    }

}

-(void)updateTheAI: (SKSpriteNode *) player {
    for (int i =0; i <self.enemyList.count;i++){
        [_enemyList[i] runAIWithPlayer: player];
        [_enemyList[i] death];
    }
}


@end