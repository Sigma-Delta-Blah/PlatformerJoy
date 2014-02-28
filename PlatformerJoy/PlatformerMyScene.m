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
@property ( nonatomic)BOOL moving;
@property (nonatomic) float groundYPos;
@property (strong, nonatomic)SKSpriteNode *objSprite;
@property (strong, nonatomic)SKNode *world;
@property (strong, nonatomic)UITouch *setTouch;

@end

@implementation PlatformerMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        // coords of lower left corner are (0, 133)

        self.anchorPoint = CGPointMake (0.5,0.5);
        
        self.backgroundColor = [SKColor colorWithRed:1.0 green:0.0 blue:0.5 alpha:0];
        self.music = [SKAction playSoundFileNamed: @"06 Bamboo Forest of the Full Moon.mp3" waitForCompletion:true];
        [self runAction: _music];
        
        self.world = [SKNode node];
        [self addChild:self.world];
        
        _billy = [[MapData alloc] init];
        [_billy createLevelOne: self.world];
        
        self.jumping = FALSE;
        _groundYPos = 0;//place holder
        PhysicsController *physics = [[PhysicsController alloc] init];
        self.physicsWorld.gravity = CGVectorMake(0, -.8);
        self.objSprite = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(16,32)];
        [physics playerPhysics:self.objSprite];
        self.objSprite.position = CGPointMake(32, 32);
        self.objSprite.name = @"camera";
        [self.world addChild:self.objSprite];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        myLabel.text = @"PlatformerJoy!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        [self.world addChild:myLabel];
    }
    return self;
}

- (void)didSimulatePhysics
{
    [self centerOnNode: [self.world childNodeWithName: @"camera"]];
}

- (void) centerOnNode: (SKNode *) node
{
    CGPoint cameraPositionInScene = [node.scene convertPoint:node.position fromNode:node.parent];
    node.parent.position = CGPointMake(node.parent.position.x - cameraPositionInScene.x,                                       node.parent.position.y - cameraPositionInScene.y);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
     for (UITouch *touch in touches) {
         self.moving = true;
            CGPoint location = [touch locationInNode:self];
         if (location.y >= CGRectGetMidY(self.frame) + 38 && self.jumping == FALSE && fabs(self.objSprite.physicsBody.velocity.dy) <1){
             self.jumping = TRUE;
             self.objSprite.position = CGPointMake(self.objSprite.position.x, self.objSprite.position.y + 1);
             self.objSprite.physicsBody.velocity = CGVectorMake(self.objSprite.physicsBody.velocity.dx, 150);
             _groundYPos = self.objSprite.position.y - .2;
         } else {
             self.setTouch = touch;
         }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    self.moving = FALSE;
    if (self.setTouch){
        self.setTouch = nil;
    }
}

-(void)update:(CFTimeInterval)currentTime {
    [self didSimulatePhysics];
    if (self.jumping == TRUE && self.objSprite.physicsBody.velocity.dy ==0){
        self.jumping = FALSE;
    }
    if (self.moving == FALSE && (self.objSprite.physicsBody.velocity.dx)*(self.objSprite.physicsBody.velocity.dx) > 9){
        self.objSprite.physicsBody.velocity = CGVectorMake(self.objSprite.physicsBody.velocity.dx*.75, self.objSprite.physicsBody.velocity.dy);
    }
    if (self.moving == FALSE && (self.objSprite.physicsBody.velocity.dx)*(self.objSprite.physicsBody.velocity.dx) <= 9){
        self.objSprite.physicsBody.velocity = CGVectorMake(0, self.objSprite.physicsBody.velocity.dy);
    }
    if (self.setTouch){
            CGPoint location = [self.setTouch locationInNode:self];
        if ((CGRectGetMidX(self.frame) - location.x > 0)){
            self.objSprite.physicsBody.velocity = CGVectorMake(-100, self.objSprite.physicsBody.velocity.dy);
            //self.action = [SKAction moveBy: CGVectorMake( -2 /* <- the larger that number is, the faster the player moves */, 0) duration:.01];
            //[self.objSprite runAction:self.action];
        }
        if ((CGRectGetMidX(self.frame) - location.x < 0)){
            self.objSprite.physicsBody.velocity = CGVectorMake(100, self.objSprite.physicsBody.velocity.dy);
            //self.action = [SKAction moveBy: CGVectorMake( 2 /* <- the larger that number is, the faster the player moves */, 0) duration:.01];
            //[self.objSprite runAction:self.action];
        }
    }
    /* Called before each frame is rendered */
}

@end
