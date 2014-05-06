//
//  ManaBar.m
//  PlatformerJoy
//
//  Created by block7 on 4/17/14.
//  Copyright (c) 2014 WOE23. All rights reserved.
//

#import "ManaBar.h"

@implementation ManaBar

-(void) createManaBar:(SKScene*)scene{
    self.manaBar = [SKSpriteNode spriteNodeWithImageNamed:@"manafull.png"];
    self.manaBar.position = CGPointMake(108, -84);
    self.manaBar.size = CGSizeMake(108, 12);
    [scene addChild:self.manaBar];
}

-(void) changeMana:(int) manaCurrent outof: (int) manaTotal{
    int ratio = 16*(manaCurrent)/manaTotal;
    switch(ratio) {
        case 16:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"manafull.png"];
            break;
        case 15:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana15.png"];
            break;
        case 14:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana14.png"];
            break;
        case 13:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana13.png"];
            break;
            
        case 12:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana12.png"];
            break;
        case 11:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana11.png"];
            break;
        case 10:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana10.png"];
            break;
        case 9:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana9.png"];
            break;
        case 8:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana8.png"];
            break;
        case 7:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana7.png"];
            break;
        case 6:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana6.png"];
            break;
        case 5:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana5.png"];
            break;
        case 4:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana4.png"];
            break;
        case 3:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana3.png"];
            break;
        case 2:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana2.png"];
            break;
        case 1:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana1.png"];
            break;
        case 0:
            self.manaBar.texture = [SKTexture textureWithImageNamed:@"mana0.png"];
            break;
    }
}

@end