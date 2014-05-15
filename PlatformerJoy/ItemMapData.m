//
//  ItemMapData.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 5/6/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "ItemMapData.h"

@implementation ItemMapData

-(void) createLevel: (SKNode *) scene withItems:(NSString *) itemTxt inTileMap:(TileMap *) tileM withPhysics:(PhysicsController *)physics withItemData:(ItemData *)iData inNode:(SKNode *)world{
    
    NSString *contentItem = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource: itemTxt ofType: @"txt"]];
    
    NSArray *arrayItem = [contentItem componentsSeparatedByString:@"\n"];
    
    int itemNumber = 0;
    
    int xValue = contentItem.length/[arrayItem count];
    int yValue = [arrayItem count];
    
    for (int n1 = 0; n1 < xValue; n1++) {
        for (int n2 = 0; n2 < yValue; n2++) {
            if ([[NSString stringWithFormat: @"%c", [arrayItem[yValue-n2-1] characterAtIndex:n1]] intValue] != 0) {
                itemNumber += 1;
            }
        }
    }
    
    int function[itemNumber];
    int xPos[itemNumber];
    int yPos[itemNumber];
    int markerNumber = 0;
    
    for (int n1 = 0; n1 < xValue; n1++) {
        for (int n2 = 0; n2 < yValue; n2++) {
            if ([[NSString stringWithFormat: @"%c", [arrayItem[yValue-n2-1] characterAtIndex:n1]] intValue] != 0) {
                //Item stuff goes here; set type of item, position of item, etc
                function[markerNumber] = [[NSString stringWithFormat: @"%c", [arrayItem[yValue-n2-1] characterAtIndex:n1]] intValue];
                xPos[markerNumber] = n1*16;
                yPos[markerNumber] = n2*16+16;
                markerNumber += 1;
            }
        }
    }
    
    for (int i = 0; i < markerNumber; i++) {
        NSLog(@"%d, %d, %d", i, xPos[i], yPos[i]);
    }
    
    [iData addItemsToWorld:markerNumber inNose:world withPhysics:physics atX: xPos atY: yPos];
    
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

-(void) createLevelOne: (SKNode *) scene inTileMap:(TileMap *) tileM withPhysics:(PhysicsController *) physics withItemData:(ItemData *) iData inNode: (SKNode *) world {
    
    [self createLevel:scene withItems:@"SampleMapItems" inTileMap:tileM withPhysics:physics withItemData:iData inNode:world];
    
}

@end
