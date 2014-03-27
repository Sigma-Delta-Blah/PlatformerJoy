//
//  PlatformerViewController.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 11/19/13.
//  Copyright (c) 2013 WOE. All rights reserved.
//

#import "PlatformerViewController.h"
#import "PlatformerMyScene.h"

@implementation PlatformerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    PlatformerMyScene *scene = [PlatformerMyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    //God
    if (!_jackelope) {
        _jackelope = [[God alloc] init];
    }
    
    if (!scene.jackelope) {
        scene.jackelope = [[God alloc] init];
    }
    
    scene.jackelope = _jackelope;
    
    [_jackelope initializePeople];
    [_jackelope initializeWorld: scene.world];
    
    // Present the scene.
    [skView presentScene:scene];
    
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
