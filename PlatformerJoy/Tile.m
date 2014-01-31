//
//  Tile.m
//  PlatformerJoy
//
//  Created by block7 on 12/13/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import "Tile.h"

@implementation Tile

- (void)setFunction: (int)type
{
    switch (type) {
        case 0:
            self.texture = NULL;
            break;
            
        case 1:
            self.physics = [[PhysicsController alloc] init];
            [self.physics tilePhysics:self];
            self.texture = [SKTexture textureWithImageNamed:@"Ground.png"];
            break;
    }
}

@end
