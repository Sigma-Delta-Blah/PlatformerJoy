//
//  Thing.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 5/5/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "Thing.h"

@implementation Thing

bool smitten = false;

-(void) smite: (SKNode *) world {
    
    if (!smitten) {
        [world removeAllChildren];
        SKSpriteNode *gameOver = [[SKSpriteNode alloc] initWithImageNamed:@"Game Over.png"];
        [world.parent addChild:gameOver];
        smitten = true;
    }

}

@end
