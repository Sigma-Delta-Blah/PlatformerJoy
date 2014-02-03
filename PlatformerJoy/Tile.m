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
        case 0: //make air block
            self.texture = NULL;
            break;
            
        case 1: //make basic ground block
            self.physics = [[PhysicsController alloc] init];
            [self.physics tilePhysics:self];
            self.texture = [SKTexture textureWithImageNamed:@"Ground.png"];
            break;
            
        case 2: //make block that collapses upon contact
            self.physics = [[PhysicsController alloc] init];
            [self.physics tilePhysics:self];
            self.physicsBody.dynamic = YES;
            self.texture = [SKTexture textureWithImageNamed:@"Ground.png"];
            break;

        case 3: //bounce tiles
            self.physics = [[PhysicsController alloc] init];
            [self.physics tilePhysics:self];
            self.physicsBody.restitution = 0.98;
            self.texture = [SKTexture textureWithImageNamed:@"Ground.png"];
            break;
    }
}

@end
