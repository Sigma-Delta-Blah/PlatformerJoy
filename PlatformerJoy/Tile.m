//
//  Tile.m
//  PlatformerJoy
//
//  Created by block7 on 12/13/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import "Tile.h"

@implementation Tile

- (void)setFunction: (int)type withTexture:(int)texture withPhysicsController: (PhysicsController *) physics {
    switch (type) {
        case 0: //make air block
            self.texture = NULL;
            break;
            
        case 1: //make basic ground block
            [physics tilePhysics:self];
            self.texture = [SKTexture textureWithImageNamed:@"Ground.png"];
            break;
            
        case 2: //make block that collapses upon contact
            [physics tilePhysics:self];
            self.physicsBody.dynamic = YES;
            self.texture = [SKTexture textureWithImageNamed:@"Ground.png"];
            break;

        case 3: //bounce tiles
            [physics tilePhysics:self];
            self.physicsBody.restitution = 0.98;
            self.texture = [SKTexture textureWithImageNamed:@"Ground.png"];
            break;
        
        default: //default to making an air block
            self.texture = NULL;
            break;
    }
    switch (texture) {
        case 0:
            self.texture = NULL;
            break;
        case 1:
            self.texture = [SKTexture textureWithImageNamed:@"Ground.png"];
            break;
        case 2:
            self.texture = [SKTexture textureWithImageNamed:@"GroundRed.png"];
            break;
        case 3:
            self.texture = [SKTexture textureWithImageNamed:@"GroundGreen.png"];
            break;
        default: //default texture if none is specified
            self.texture = NULL;
            break;
    }
}

@end
