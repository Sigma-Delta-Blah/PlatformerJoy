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
@property (strong, nonatomic)SKNode *world;

@end

@implementation PlatformerMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {

        self.anchorPoint = CGPointMake (0.5,0.5);
        
        self.backgroundColor = [SKColor colorWithRed:1.0 green:0.0 blue:0.5 alpha:0];
        self.music = [SKAction playSoundFileNamed: @"06 Bamboo Forest of the Full Moon.mp3" waitForCompletion:true];
        [self runAction: _music];
        
        self.world = [SKNode node];
        [self addChild:self.world];
        
        _billy = [[MapData alloc] init];
        [_billy createLevelOne: self.world];
        
        _chazzet = [[PlayerData alloc] init];
        [_chazzet createPlayer: self.world];
        
        self.physicsWorld.gravity = CGVectorMake(0, -.8);
        
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
    node.parent.position = CGPointMake(node.parent.position.x - cameraPositionInScene.x, node.parent.position.y - cameraPositionInScene.y);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
<<<<<<< HEAD
     for (UITouch *touch in touches) {
            CGPoint location = [touch locationInNode:self];
<<<<<<< HEAD
         if (location.y >= self.objSprite.position.y + 30 && self.jumping == FALSE){
=======
         if (location.y >= CGRectGetMidY(self.frame) + 38 && self.jumping == FALSE && fabs(self.objSprite.physicsBody.velocity.dy) <1){
>>>>>>> master
             self.jumping = TRUE;
             self.objSprite.position = CGPointMake(self.objSprite.position.x, self.objSprite.position.y + 1);
<<<<<<< HEAD
             self.objSprite.physicsBody.velocity = CGVectorMake(0, 75);
=======
             self.objSprite.physicsBody.velocity = CGVectorMake(0, 150);
>>>>>>> master
             _groundYPos = self.objSprite.position.y - .2;
         } else {
             self.setTouch = touch;
         }
    }
=======
    [_chazzet movementPlayerBegin:touches inScene:self];
    
>>>>>>> FETCH_HEAD
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [_chazzet movementPlayerEnd:touches inScene:self];
    
}

-(void)update:(CFTimeInterval)currentTime {
    [self didSimulatePhysics];

    [_chazzet movementPlayerUpdate:self];
    
}

@end
