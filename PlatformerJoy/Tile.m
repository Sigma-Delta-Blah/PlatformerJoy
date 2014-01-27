//
//  Tile.m
//  PlatformerJoy
//
//  Created by block7 on 12/13/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import "Tile.h"

@implementation Tile

- (id) initWithFunction: (NSInteger)functionSet
{
    self = [super init];
    if (self) {
        self.function = &(functionSet);
        //Implement physics body and stuff here as well using cases; we haven't figured this out yet entirely, and have been trying multiple ideas.
        //self = [self initWithImageNamed:@"GroundRed.png"]; This isn't working, so we will need a different method, but images will also go in cases based on the function of the block
    }
    return self;
}

- (void)setFunction: (NSInteger*)type
{
    self.function = type;
    //Can be used to change function for, say, self-destructing blocks or other things that could change mid-game; the physics and image would also need to change then too
}

- (NSInteger)getFunction
{
    return *(self.function);
}

@end
