//
//  EnemyMapData.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 3/7/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "EnemyMapData.h"

@implementation EnemyMapData

-(void) createLevel: (SKNode *) scene withEnemies:(NSString *) enemyTxt inTileMap:(TileMap *) tileM withPhysics:(PhysicsController *)physics withEnemyData:(EnemyData *)eData inNode:(SKNode *)world{
    
    NSString *contentEnemy = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource: enemyTxt ofType: @"txt"]];
    
    NSArray *arrayEnemy = [contentEnemy componentsSeparatedByString:@"\n"];
    
    int enemyNumber = 0;
    
    int xValue = contentEnemy.length/[arrayEnemy count];
    int yValue = [arrayEnemy count];
    
    for (int n1 = 0; n1 < xValue; n1++) {
        for (int n2 = 0; n2 < yValue; n2++) {
            if ([[NSString stringWithFormat: @"%c", [arrayEnemy[yValue-n2-1] characterAtIndex:n1]] intValue] != 0) {
                //Enemy stuff goes here; set type of enemy, position of enemy, etc
                enemyNumber += 1;
            }
        }
    }
    
    int function[enemyNumber];
    int xPos[enemyNumber];
    int yPos[enemyNumber];
    int markerNumber = 0;
    
    for (int n1 = 0; n1 < xValue; n1++) {
        for (int n2 = 0; n2 < yValue; n2++) {
            if ([[NSString stringWithFormat: @"%c", [arrayEnemy[yValue-n2-1] characterAtIndex:n1]] intValue] != 0) {
                //Enemy stuff goes here; set type of enemy, position of enemy, etc
                function[markerNumber] = [[NSString stringWithFormat: @"%c", [arrayEnemy[yValue-n2-1] characterAtIndex:n1]] intValue];
                xPos[markerNumber] = n1*16;
                yPos[markerNumber] = n2*16+16;
                markerNumber += 1;
            }
        }
    }
    
    for (int i = 0; i < markerNumber; i++) {
        NSLog(@"%d, %d, %d", i, xPos[i], yPos[i]);
    }
    
    [eData addEnemiesToWorld:markerNumber inNose:world withPhysics:physics atX: xPos atY: yPos];
    
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

-(void) createLevelOne: (SKNode *) scene inTileMap:(TileMap *) tileM withPhysics:(PhysicsController *) physics withEnemyData:(EnemyData *) eData inNode: (SKNode *) world {
    
    [self createLevel:scene withEnemies:@"SampleMapEnemies" inTileMap:tileM withPhysics:physics withEnemyData:eData inNode:world];
    
}

@end
