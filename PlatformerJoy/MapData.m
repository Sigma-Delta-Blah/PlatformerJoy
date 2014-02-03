//
//  MapData.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 1/27/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "MapData.h"

@implementation MapData

-(void) blankMap: (SKNode *) scene {
    
    if (!_bob) {
        _bob = [[TileMap alloc] init];
    }
    
    [_bob setMapofWidth: 0 andHeight: 0];
    
    //[scene removeAllChildren];
    
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

-(void) createLevelOne: (SKNode *) scene{
    
    if (!_bob) {
        _bob = [[TileMap alloc] init];
    }
    
    [_bob setMapofWidth: 100 andHeight: 30];
    
    for (int number_x = 0; number_x < 1; number_x++) {
        for (int number_y = 0; number_y < 30; number_y++) {
            [[_bob getTileAtX:number_x andY:number_y] setFunction: 4];
        }
    }
    for (int number_x = 1; number_x < 99; number_x++) {
        for (int number_y = 6; number_y < 30; number_y++) {
            [[_bob getTileAtX:number_x andY:number_y] setFunction: 0];
        }
    }
    for (int number_x = 1; number_x < 10; number_x++) {
        for (int number_y = 5; number_y < 6; number_y++) {
            [[_bob getTileAtX:number_x andY:number_y] setFunction: 4];
        }
    }
    for (int number_x = 10; number_x < 99; number_x++) {
        for (int number_y = 5; number_y < 6; number_y++) {
            [[_bob getTileAtX:number_x andY:number_y] setFunction: 0];
        }
    }
    for (int number_x = 1; number_x < 99; number_x++) {
        for (int number_y = 1; number_y < 5; number_y++) {
            [[_bob getTileAtX:number_x andY:number_y] setFunction: 0];
        }
    }
    for (int number_x = 1; number_x < 99; number_x++) {
        for (int number_y = 0; number_y < 1; number_y++) {
            [[_bob getTileAtX:number_x andY:number_y] setFunction: 4];
        }
    }
    for (int number_x = 99; number_x < 100; number_x++) {
        for (int number_y = 0; number_y < 30; number_y++) {
            [[_bob getTileAtX:number_x andY:number_y] setFunction: 4];
        }
    }
    
    //[scene removeAllChildren];
    
    for (int number_x = 0; number_x < 100; number_x++) {
        for (int number_y = 0; number_y < 30; number_y++) {
            [scene addChild:[_bob getTileAtX:number_x andY:number_y]];
        }
    }
    
}

@end
