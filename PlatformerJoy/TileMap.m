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
    
    self.tiles = [[NSMutableArray alloc] init];
    
    xSize = xValue;
    ySize = yValue;
    
    Tile *sprites[xValue*yValue];
    PhysicsController *physics[xValue*yValue];
    
    for (int number = 0; number < xValue*yValue; number++) {
        float A = (number%xValue)*16+(16/2);
        float B = ((number-number%xValue)/xValue)*16+194+(16/2);
        NSLog([NSString stringWithFormat:@"%f, %f", A, B]);
        if (B > 202) {
            sprites[number] = [Tile spriteNodeWithImageNamed:@"GroundRed.png"];
        } else {
            sprites[number] = [Tile spriteNodeWithImageNamed:@"Ground.png"];
            physics[number] = [[PhysicsController alloc] init];
            [physics[number] tilePhysics:sprites[number]];
        }
        sprites[number].position = CGPointMake(A, B);
        [_tiles addObject:sprites[number]];
    }

}

-(SKSpriteNode *) getTileAtX:(int) xValue andY:(int) yValue {
    return [_tiles objectAtIndex:(int)(yValue*xSize+xValue)];
}

@end