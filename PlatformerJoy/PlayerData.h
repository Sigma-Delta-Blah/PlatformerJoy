//
//  PlayerData.h
//  PlatformerJoy
//
//  Created by Joseph Mooney on 2/28/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "PhysicsController.h"

@interface PlayerData : NSObject

@property (strong, nonatomic)SKSpriteNode *objSprite;
@property (strong, nonatomic)UITouch *setTouch;
@property (nonatomic) float groundYPos;
@property (nonatomic)BOOL jumping;
@property (nonatomic)BOOL moving;

<<<<<<< HEAD
-(void)jump;

//- (void)didMoveToView:(SKView *)view inScene:(SKScene*) scene;

//-(void)handleUpSwipe: (UIGestureRecognizer*)recognizer inScene: (SKScene *) scene;

=======
>>>>>>> parent of 7a76ec7... Merge branch 'Keith' of https://github.com/Sigma-Delta-Blah/PlatformerJoy into Keith
-(void) createPlayer: (SKNode *) world withPhysics: (PhysicsController *) physics;

-(void) movementPlayerBegin: (NSSet *) touches inScene: (SKNode *) scene;

-(void) movementPlayerEnd: (NSSet *) touches inScene: (SKNode *) scene;

-(void) movementPlayerUpdate: (SKNode *) scene;

@end