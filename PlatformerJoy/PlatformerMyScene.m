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
        
        
        _billy = [[MapData alloc] init];
        [_billy createLevelOne: self];
        
        self.jumping = FALSE;
        _groundYPos = 0;//place holder
        PhysicsController *physics = [[PhysicsController alloc] init];
        self.physicsWorld.gravity = CGVectorMake(0, -.8);
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
             self.objSprite.physicsBody.velocity = CGVectorMake(0, 150);
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
    if (self.jumping == TRUE && self.objSprite.physicsBody.velocity.dy ==0){
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
