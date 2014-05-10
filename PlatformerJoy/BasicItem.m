//
//  BasicItem.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 5/6/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "BasicItem.h"

@implementation BasicItem

-(void)createWithLocationAndImage:(NSString *)fileName x:(int) x y:(int) y inScene: (SKNode *) scene withType:(int) type withPhysics: (PhysicsController *) physics {
    
    self.name = @"item";
    
    switch (type) {
        case 0:
            self.position = CGPointMake(x, y);
            self.size = CGSizeMake(16, 15);
            self.texture = [SKTexture textureWithImageNamed:fileName];
            break;
        case 1:
            break;
        case 2:
            break;
        default:
            break;
    }
    
    [physics itemPhysics:self];
    [scene addChild:self];
    
}

@end
