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
        //self = [self initWithImageNamed:@"GroundRed.png"];
    }
    return self;
}

- (void)setFunction: (NSInteger*)type
{
    self.function = type;
}

- (NSInteger)getFunction
{
    return *(self.function);
}

@end
