//
//  PlatformerMyScene.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 11/19/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

//xp = fnint(100X +500, X, 0, X)

#import "PlatformerMyScene.h"
#import "PhysicsController.h"
@interface PlatformerMyScene()

@property (strong, nonatomic)UIGravityBehavior *gravity;
@property (strong, nonatomic)UIDynamicAnimator *animator;
@property (strong, nonatomic)UIDynamicItemBehavior *behavior;
@property (strong, nonatomic)SKAction *action;
@property (strong, nonatomic) SKAction *music;
@property ( nonatomic)BOOL jumping;
@property (nonatomic) float groundYPos;
@property (strong, nonatomic)SKSpriteNode *objSprite;
@property (strong, nonatomic)UITouch *setTouch;

@end

@implementation PlatformerMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        // coords of lower left corner are (0, 133)

        self.backgroundColor = [SKColor colorWithRed:0.2 green:0.458 blue:0.658 alpha:0];
        self.music = [SKAction playSoundFileNamed: @"06 Bamboo Forest of the Full Moon.mp3" waitForCompletion:true];
        [self runAction: _music];
        
        
        _bob = [[TileMap alloc] init];
        [_bob setMapofWidth: 20 andHeight: 12];
        
        for (int number = 0; number < 20; number++) {
            for (int number2 = 0; number2 < 12; number2++) {
                if([_bob getTileAtX:number andY:number2]) {
                    NSLog([NSString stringWithFormat:@"Phillium %d, %d is good to go!", number, number2]);
                } else {
                    NSLog([NSString stringWithFormat:@"Phillium %d, %d is having problems!  WE ARE GOING DOWN!!!  AAAAARRRRGGGGHHHHNJ#KRWJEGFNTBHGTKLRWFMFNTOKJENVG!!!!!!!!!!!!!!!!!!!!!", number, number2]);
                }
                [self addChild:[_bob getTileAtX:number andY:number2]];
            }
        }
        
        
        self.jumping = FALSE;
        _groundYPos = 0;//place holder
        PhysicsController *physics = [[PhysicsController alloc] init];
        self.physicsWorld.gravity = CGVectorMake(0, -1);
        self.objSprite = [SKSpriteNode spriteNodeWithColor:[UIColor purpleColor] size:CGSizeMake(25,25)];
        [physics playerPhysics:self.objSprite];
        self.objSprite.position = CGPointMake(200, 400);
        [self addChild:self.objSprite];
        
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        myLabel.text = @"PlatformerJoy!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
     for (UITouch *touch in touches) {
            CGPoint location = [touch locationInNode:self];
         if (location.y >= self.objSprite.position.y + 60 && self.jumping == FALSE){
             self.jumping = TRUE;
             self.objSprite.position = CGPointMake(self.objSprite.position.x, self.objSprite.position.y + 1);
             self.action = [SKAction moveBy:CGVectorMake(0, 225 ) duration:1.5];
             [self.objSprite runAction:self.action];
             _groundYPos = self.objSprite.position.y - .2;
         } else {
             self.setTouch = touch;
         }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (self.setTouch){
        self.setTouch = nil;
        NSLog(@"touch removed");
    }
}

-(void)update:(CFTimeInterval)currentTime {
    if (self.jumping == TRUE && self.objSprite.position.y <= _groundYPos){
        NSLog(@"ground of jump is %f", _groundYPos);
        self.jumping = FALSE;
    }
    if (self.setTouch){
            CGPoint location = [self.setTouch locationInNode:self];
        NSLog([NSString stringWithFormat:@"X Location is %f; Y Location is %f", location.x, location.y]);
        if (self.objSprite.position.x - location.x > 0){
            self.action = [SKAction moveBy: CGVectorMake( -2 /* <- the larger that number is, the faster the player moves */, 0) duration:.01];
            [self.objSprite runAction:self.action];
        }
        if (self.objSprite.position.x - location.x < 0){
            self.action = [SKAction moveBy: CGVectorMake( 2 /* <- the larger that number is, the faster the player moves */, 0) duration:.01];
            [self.objSprite runAction:self.action];
        }
    }
    /* Called before each frame is rendered */
}

@end