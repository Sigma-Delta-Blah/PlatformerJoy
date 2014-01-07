//
//  PlatformerMyScene.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 11/19/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import "PlatformerMyScene.h"

@implementation PlatformerMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.09 green:0.09 blue:0.8 alpha:0.8];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Welcome!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        _bob = [[TileMap alloc] init];
        
        [_bob setMapofWidth: 14 andHeight: 20];
        
        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];

        for (int number = 0; number < 14; number++) {
            for (int number2 = 0; number2 < 20; number2++) {
                if([_bob getTileAtX:number andY:number2]) {
                    NSLog([NSString stringWithFormat:@"Phillium %d, %d is good to go!", number, number2]);
                } else {
                    NSLog([NSString stringWithFormat:@"Phillium %d, %d is having problems!  WE ARE GOING DOWN!!!  AAAAARRRRGGGGHHHHNJ#KRWJEGFNTBHGTKLRWFMFNTOKJENVG!!!!!!!!!!!!!!!!!!!!!", number, number2]);
                }
                [self addChild:[_bob getTileAtX:number andY:number2]];
            }
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
