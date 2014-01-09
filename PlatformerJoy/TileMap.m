//
//  TileMap.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 11/25/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import "TileMap.h"

@implementation TileMap

int xSize;
int ySize;

-(void) setMapofWidth:(int) xValue andHeight:(int) yValue {
    
    self.tiles = [[NSMutableArray alloc] init];
    
    xSize = xValue;
    ySize = yValue;
    
    Tile *sprites[xValue*yValue];
    
    for (int number = 0; number < xValue*yValue; number++) {
        sprites[number] = [Tile spriteNodeWithImageNamed:@"GroundRed.png"];
        float A = (number%yValue)*16+(16/2);
        float B = ((number-number%yValue)/yValue)*16+194+(16/2);
        NSLog([NSString stringWithFormat:@"%f, %f", A, B]);
        sprites[number].position = CGPointMake(A, B);
        [_tiles addObject:sprites[number]];
    }

}

-(SKSpriteNode *) getTileAtX:(int) xValue andY:(int) yValue {
    return [_tiles objectAtIndex:(int)(yValue*xSize+xValue)];
}

@end