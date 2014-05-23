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

@interface PlatformerMyScene() <SKPhysicsContactDelegate>

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
        
        self.physicsWorld.contactDelegate = self;
        
    }
    return self;
}

- (void)didMoveToView:(SKView *)view{
    UISwipeGestureRecognizer *upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleUpSwipe:)];
    upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    [[self view] addGestureRecognizer:upSwipe];
    upSwipe.cancelsTouchesInView = FALSE;
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightSwipe:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [[self view] addGestureRecognizer:rightSwipe];
    rightSwipe.cancelsTouchesInView = FALSE;
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftSwipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [[self view] addGestureRecognizer:leftSwipe];
    leftSwipe.cancelsTouchesInView = FALSE;
    
    UISwipeGestureRecognizer *downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleDownSwipe:)];
    downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    [[self view] addGestureRecognizer:downSwipe];
    downSwipe.cancelsTouchesInView = FALSE;
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

-(void)didBeginContact:(SKPhysicsContact *)contact {
    
    [_jackelope didBeginContact: contact inWorld: _world];
    
}

-(void)didEndContact:(SKPhysicsContact *)contact {
    
    [_jackelope didEndContact: contact inWorld: _world];
    
}

-(void)handleUpSwipe: (UIGestureRecognizer*)recognizer {
    
    NSLog(@"Upward Swipe Recognized!");
    [_jackelope playerJump];
    
}

-(void)handleRightSwipe: (UIGestureRecognizer*)recognizer {
    [_jackelope attackWorld:self.world direction: 1];
    NSLog(@"Right Swipe Recognized!");
    
}

-(void)handleLeftSwipe: (UIGestureRecognizer*)recognizer {
    [_jackelope attackWorld:self.world direction: 2];
    NSLog(@"Left Swipe Recognized!");
    
}

-(void)handleDownSwipe: (UIGestureRecognizer*)recognizer {
    
    NSLog(@"Down Swipe Recognized!");
    
}

-(void)update:(CFTimeInterval)currentTime {
    [self didSimulatePhysics];
    [_jackelope updateScene: self :_world];
    
}

@end
