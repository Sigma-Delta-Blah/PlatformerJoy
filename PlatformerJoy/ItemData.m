//
//  ItemData.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 5/6/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "ItemData.h"

@implementation ItemData

-(void)addItemsToWorld:(int) numberToCreate inNose:(SKNode *) world withPhysics:(PhysicsController *)physics atX: (int[]) xPos atY: (int[]) yPos {
    
    if(!self.itemList){
        self.itemList = [[NSMutableArray alloc] init];
    }
    
    for (int i = 0; i < numberToCreate; i++) {
        NSLog(@"%d, %d, %d", i, xPos[i], yPos[i]);
    }
    
    BasicItem *tempList[numberToCreate];
    //[_itemList removeAllObjects];
    for (int i = 0; i < numberToCreate; i++){
        tempList[i] = [BasicItem spriteNodeWithImageNamed:@"GroundGreen.png"];
        [_itemList addObject:tempList[i]];
        [_itemList[i] createWithLocationAndImage:@"GroundGreen.png" x: xPos[i] y: yPos[i] inScene:world withType:0 withPhysics:physics];
    }
    
}

@end
