//
//  ItemData.h
//  PlatformerJoy
//
//  Created by Joseph Mooney on 5/6/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhysicsController.h"
#import "BasicItem.h"

@interface ItemData : NSObject

@property (strong, nonatomic) NSMutableArray *itemList;

-(void)addItemsToWorld:(int) numberToCreate inNose:(SKNode *) world withPhysics:(PhysicsController *)physics atX: (int[]) xPos atY: (int[]) yPos;

@end
