//
//  EnemyMapData.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 3/7/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "EnemyMapData.h"

@implementation EnemyMapData

-(void) createLevel: (SKNode *) scene withEnemies:(NSString *) enemyTxt inTileMap:(TileMap *) tileM {
    
    NSString *contentEnemy = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource: enemyTxt ofType: @"txt"]];
    
    NSArray *arrayEnemy = [contentEnemy componentsSeparatedByString:@"\n"];
    
    int xValue = contentEnemy.length/[arrayEnemy count];
    int yValue = [arrayEnemy count];
    
    for (int n1 = 0; n1 < xValue; n1++) {
        for (int n2 = 0; n2 < yValue; n2++) {
<<<<<<< HEAD
            if ([[NSString stringWithFormat: @"%c", [arrayEnemy[yValue-n2-1] characterAtIndex:n1]] intValue] != 0) {
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
=======
            if ([[NSString stringWithFormat: @"%c", [arrayEnemy[yValue-n2-1] characterAtIndex:n1]] intValue] && ![tileM getTileAtX:n1 andY:n2] && ![tileM getTileAtX:n1 andY:n2+1]) {
>>>>>>> Keith
                //Enemy stuff goes here; set type of enemy, position of enemy, etc
            }
        }
    }
    
}

@end
