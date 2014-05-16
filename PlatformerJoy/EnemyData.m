//
//  EnemyData.m
//  PlatformerJoy
//
//  Created by block7 on 3/4/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "EnemyData.h"

@implementation EnemyData

<<<<<<< HEAD
-(void)addEnemiesToWorld:(int) numberToCreate inNose:(SKNode *) world{
=======
-(void)addEnemiesToWorld:(int) numberToCreate inNose:(SKNode *) world withPhysics:(PhysicsController *)physics{
>>>>>>> FETCH_HEAD
    if(!self.enemyList){
        self.enemyList = [[NSMutableArray alloc] init];
    }
    
    BasicEnemy *tempList[numberToCreate];
    [_enemyList removeAllObjects];
    for (int i = 0; i < numberToCreate; i++){
        tempList[i] = [BasicEnemy spriteNodeWithImageNamed:@"Ground.png"];
        [_enemyList addObject:tempList[i]];
<<<<<<< HEAD
        [_enemyList[i] createWithLocationAndImage:@"Ground.png" x:i*32+32 y:32 inScene:world withType:0];
    
=======
        [_enemyList[i] createWithLocationAndImage:@"Ground.png" x:i*32+32 y:32 inScene:world withType:0 withPhysics:physics];
        
>>>>>>> FETCH_HEAD
    }
    
}

-(void)updateTheAI: (SKSpriteNode *) player {
    for (int i =0; i <self.enemyList.count;i++){
        [_enemyList[i] runAIWithPlayer: player];
<<<<<<< HEAD
}
=======
    }
>>>>>>> FETCH_HEAD
}


@end