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

@property ( nonatomic)BOOL jumping;
@property (nonatomic) float groundYPos;
@property (strong, nonatomic)SKSpriteNode *objSprite;
@property (strong, nonatomic)UITouch *setTouch;

@end

@implementation PlatformerMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
<<<<<<< HEAD
        
        self.anchorPoint = CGPointMake(0, 0);
        
        self.backgroundColor = [SKColor colorWithRed:0.09 green:0.09 blue:0.8 alpha:0.8];
        
=======
        // coords of lower left corner are (0, 133)

        self.jumping = FALSE;
        _groundYPos = 0;//place holder
        PhysicsController *physics = [[PhysicsController alloc] init];
        self.physicsWorld.gravity = CGVectorMake(0, -1);
        self.objSprite = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(25,25)];
        [physics playerPhysics:self.objSprite];
        [self addChild:self.objSprite];
        self.backgroundColor = [SKColor colorWithRed:0.2 green:0.458 blue:0.658 alpha:0];
>>>>>>> master
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        myLabel.text = @"Welcome!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        _bob = [[TileMap alloc] init];
        
        [_bob setMapofWidth: 12 andHeight: 20];
        
        for (int number = 0; number < 12; number++) {
            for (int number2 = 0; number2 < 20; number2++) {
                if([_bob getTileAtX:number andY:number2]) {
                    NSLog([NSString stringWithFormat:@"Phillium %d, %d is good to go!", number, number2]);
                } else {
                    NSLog([NSString stringWithFormat:@"Phillium %d, %d is having problems!  WE ARE GOING DOWN!!!  AAAAARRRRGGGGHHHHNJ#KRWJEGFNTBHGTKLRWFMFNTOKJENVG!!!!!!!!!!!!!!!!!!!!!", number, number2]);
                }
                [self addChild:[_bob getTileAtX:number andY:number2]];
            }
        }

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
             _groundYPos = self.objSprite.position.y + .8;
             self.objSprite.position = CGPointMake(self.objSprite.position.x, self.objSprite.position.y + 1);
                 self.action = [SKAction moveBy:CGVectorMake(0, 100 ) duration:1];
                 [self.objSprite runAction:self.action];
             self.jumping = TRUE;
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
        if (self.objSprite.position.x - location.x > 0){
            self.action = [SKAction moveBy: CGVectorMake( -1 /* <- the smaller that number is, the faster the player moves */, 0) duration:.01];
            [self.objSprite runAction:self.action];
        }
        if (self.objSprite.position.x - location.x < 0){
            self.action = [SKAction moveBy: CGVectorMake( 1 /* <- the smaller that number is, the faster the player moves */, 0) duration:.01];
            [self.objSprite runAction:self.action];
        }
    }
    /* Called before each frame is rendered */
}

@end
