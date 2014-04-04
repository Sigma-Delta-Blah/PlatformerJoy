//
//  HpBar.m
//  PlatformerJoy
//
//  Created by block7 on 3/7/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "HpBar.h"

@implementation HpBar

-(void) createHpBar:(SKScene *)scene {
    self.hpBar = [SKSpriteNode spriteNodeWithImageNamed:@"hpfull.png"];
    self.hpBar.position = CGPointMake(-108, -84);
    self.hpBar.size = CGSizeMake(108, 12);
    [scene addChild:self.hpBar];
}

-(void) changeHp:(int) hpCurrent outOf:(int) hpTotal {
    int ratio = 16*(hpCurrent)/hpTotal;
    switch(ratio) {
        case 16:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hpfull.png"];
            break;
        case 15:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp15.png"];
            break;
        case 14:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp14.png"];
            break;
        case 13:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp13.png"];
            break;
            
        case 12:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp12.png"];
            break;
        case 11:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp11.png"];
            break;
        case 10:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp10.png"];
            break;
        case 9:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp9.png"];
            break;
        case 8:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp8.png"];
            break;
        case 7:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp7.png"];
            break;
        case 6:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp6.png"];
            break;
        case 5:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp5.png"];
            break;
        case 4:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp4.png"];
            break;
        case 3:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp3.png"];
            break;
        case 2:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp2.png"];
            break;
        case 1:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp1.png"];
            break;
        case 0:
            self.hpBar.texture = [SKTexture textureWithImageNamed:@"hp0.png"];
            break;
    }
}

@end