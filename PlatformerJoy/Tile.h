//
//  Tile.h
//  PlatformerJoy
//
//  Created by block7 on 12/13/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "PhysicsController.h"

@interface Tile : SKSpriteNode

- (void)setFunction: (int)type withTexture: (int)texture withPhysicsController: (PhysicsController *) physics;

- (void)setFunction: (int)type withPhysicsController: (PhysicsController *) physics;

@end
