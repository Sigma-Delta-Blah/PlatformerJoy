//
//  TileMap.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 11/25/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import "TileMap.h"
#import "PhysicsController.h"

@implementation TileMap

int xSize;
int ySize;

-(void) setMapofWidth:(int) xValue andHeight:(int) yValue {
    
    if (!self.tiles) {
        self.tiles = [[NSMutableArray alloc] init];
    }
    
    [self.tiles removeAllObjects];
    
    xSize = xValue;
    ySize = yValue;
    
    Tile *sprites[xValue*yValue];
    
    for (int number = 0; number < xValue*yValue; number++) {
        float A = (number%xValue)*16+(16/2);
        float B = ((number-number%xValue)/xValue)*16+(16/2);
        sprites[number] = [Tile spriteNodeWithImageNamed: @"Tile - Grey"];
        sprites[number].position = CGPointMake(A, B);
        [_tiles addObject:sprites[number]];
    }

}

-(Tile *) getTileAtX:(int) xValue andY:(int) yValue {
    return [_tiles objectAtIndex:(int)(yValue*xSize+xValue)];
}

@end