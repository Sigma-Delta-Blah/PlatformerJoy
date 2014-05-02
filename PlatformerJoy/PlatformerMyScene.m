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

@end

@implementation PlatformerMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {

        self.anchorPoint = CGPointMake (0.5,0.5);
        
        self.backgroundColor = [SKColor colorWithRed:1.0 green:0.0 blue:0.5 alpha:0];
        self.music = [SKAction playSoundFileNamed: @"06 Bamboo Forest of the Full Moon.mp3" waitForCompletion:true];
        [self runAction: _music];
     
        if (!_world) {
        _world = [[SKNode alloc] init];
        }
        [self addChild:_world];
        
        self.physicsWorld.gravity = CGVectorMake(0, -.8);
        
    }
    return self;
}

- (void)didMoveToView:(SKView *)view{
    UISwipeGestureRecognizer *upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleUpSwipe:)];
    upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    [[self view] addGestureRecognizer:upSwipe];
    upSwipe.cancelsTouchesInView = FALSE;
}

- (void)didSimulatePhysics
{
    [self centerOnNode: [_world childNodeWithName: @"camera"]];
}

- (void) centerOnNode: (SKNode *) node
{
    CGPoint cameraPositionInScene = [node.scene convertPoint:node.position fromNode:node.parent];
    node.parent.position = CGPointMake(node.parent.position.x - cameraPositionInScene.x, node.parent.position.y - cameraPositionInScene.y);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [_jackelope beginMovement: touches inScene:self];
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [_jackelope endMovement: touches inScene: self];
    
}

-(void)update:(CFTimeInterval)currentTime {
    [self didSimulatePhysics];
    [_jackelope updateScene: self];
    if([_jackelope.bobbette getHp] <= 0) {
        [God smite: self];
    }
}

-(void)handleUpSwipe: (UIGestureRecognizer*)recognizer {
    NSLog(@"Upward Swipe Recognized!");
    [_jackelope playerJump];
}

@end
