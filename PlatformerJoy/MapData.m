//
//  MapData.m
//  PlatformerJoy
//
//  Created by Joseph Mooney on 1/27/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "MapData.h"

@implementation MapData

-(void) blankMap: (SKNode *) scene inMap:(TileMap *)map {
    
    [map setMapofWidth: 0 andHeight: 0];
    
    //[scene removeAllChildren];
    
}

-(void) createLevel: (SKNode *) scene withFunction:(NSString *)functionTxt withTexture:(NSString *)textureTxt withBackground:(NSString *)backgroundTxt withPhysics: (PhysicsController *) physics inMap:(TileMap *)map {
    
    NSString *contentFunction = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource: functionTxt ofType: @"txt"]];
    NSString *contentTexture = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource: textureTxt ofType: @"txt"]];
    
    NSArray *arrayFunction = [contentFunction componentsSeparatedByString:@"\n"];
    NSArray *arrayTexture = [contentTexture componentsSeparatedByString:@"\n"];
    
    int xValue = contentFunction.length/[arrayFunction count];
    int yValue = [arrayFunction count];
    
    [map setMapofWidth: xValue andHeight: yValue];
    
    self.background = [SKSpriteNode spriteNodeWithImageNamed: backgroundTxt];
    self.background.zPosition = -1;
    self.background.size = CGSizeMake(568, 320);
    self.background.position = CGPointMake(0, 0);
    [scene.parent addChild:self.background];
    
    for (int n1 = 0; n1 < xValue; n1++) {
        for (int n2 = 0; n2 < yValue; n2++) {
            [[map getTileAtX:n1 andY:n2] setFunction: [[NSString stringWithFormat: @"%c", [arrayFunction[yValue-n2-1] characterAtIndex:n1]] intValue] withTexture: [[NSString stringWithFormat: @"%c", [arrayTexture[yValue-n2-1] characterAtIndex:n1]] intValue] withPhysicsController: physics];
        }
    }
    
    //[scene removeAllChildren];
    
    for (int number_x = 0; number_x < xValue; number_x++) {
        for (int number_y = 0; number_y < yValue; number_y++) {
            [scene addChild:[map getTileAtX:number_x andY:number_y]];
        }
    }
    
}


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


-(void) createLevelOne: (SKNode *) scene withPhysics: (PhysicsController *) physics inMap: (TileMap *) map {
    
    [self createLevel:scene withFunction:@"SampleMapFunction" withTexture:@"SampleMapTexture" withBackground:@"Background - Pink Sky" withPhysics: physics inMap: map];
    
}

@end
