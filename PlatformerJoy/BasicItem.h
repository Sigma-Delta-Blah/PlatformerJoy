//
//  BasicItem.h
//  PlatformerJoy
//
//  Created by Joseph Mooney on 5/6/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "PhysicsController.h"

@interface BasicItem : SKSpriteNode

-(void)createWithLocationAndImage:(NSString *)fileName x:(int) x y:(int) y inScene: (SKNode *) scene withType:(int) type withPhysics: (PhysicsController *) physics;

@end
