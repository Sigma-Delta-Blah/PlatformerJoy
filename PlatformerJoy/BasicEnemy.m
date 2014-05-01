//
//  BasicEnemy.m
//  PlatformerJoy
//
//  Created by block7 on 3/6/14.
//  Copyright (c) 2014 WOE. All rights reserved.
//

#import "BasicEnemy.h"

@implementation BasicEnemy
<<<<<<< HEAD
-(void)createWithLocationAndImage:(NSString *)fileName x:(int)x y:(int)y inScene: (SKNode *) scene withType:(int) type{
    PhysicsController *physics = [[PhysicsController alloc] init];
    self.name = @"enemy";
    switch (type) {
        case 0:
        self.position = CGPointMake(x, y);
        self.size = CGSizeMake(16, 31);
        self.texture = [SKTexture textureWithImageNamed:fileName];
=======
-(void)createWithLocationAndImage:(NSString *)fileName x:(int)x y:(int)y inScene: (SKNode *) scene withType:(int) type withPhysics:(PhysicsController *)physics{
    self.name = @"enemy";
    switch (type) {
        case 0:
            self.position = CGPointMake(x, y);
            self.size = CGSizeMake(16, 31);
            self.texture = [SKTexture textureWithImageNamed:fileName];
>>>>>>> FETCH_HEAD
            break;
        case 1:
            break;
        case 2:
            break;
        default:
            break;
    }
    
    [physics enemyPhysics:self];
    [scene addChild:self];
    
<<<<<<< HEAD
   }

-(void) runAIWithPlayer: (SKSpriteNode *) player{
    if (self.position.x  > player.position.x){
        self.physicsBody.velocity = CGVectorMake(-5, 0);
        NSLog(@"Loop");
    } else if (self.position.x < player.position.x){
        self.physicsBody.velocity =CGVectorMake(5, 0);
        NSLog(@"Boop");
    } else {
        self.physicsBody.velocity = CGVectorMake(0, 0);
        NSLog(@"Koopa");
    }
}
@end
=======
}

-(void) runAIWithPlayer: (SKSpriteNode *) player{
    if (self.position.x  > player.position.x){
        self.physicsBody.velocity = CGVectorMake(-10, 0);
    } else if (self.position.x < player.position.x){
        self.physicsBody.velocity =CGVectorMake(10, 0);
    } else {
        self.physicsBody.velocity = CGVectorMake(0, 0);
    }
}
@end
>>>>>>> FETCH_HEAD
