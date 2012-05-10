//
//  Goal.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// The goal (finishline) in the game, visualised by a star.

#import "Goal.h"
#import "GraphicManager.h"
#import "SoundManager.h"

@interface Goal ()

@property (nonatomic,assign) double animation_dietime;

-(void)disappear;

@end

@implementation Goal

@synthesize sprite = _sprite;
@synthesize status = _status;
@synthesize x = _x;
@synthesize y = _y;

@synthesize animation_dietime = _animation_dietime;

-(id)init {
    self = [super init];
    if (self != nil) {
        self.sprite = [[GraphicManager sharedManager] createSpriteFromPicture:@"Sprite_Goal.png"];
        self.sprite.scale = 0.5;
        self.animation_dietime = 0;
    }
    return self;
}

-(void)hit {
    if (self.status == ALIVE) {
        [[SoundManager sharedManager] playSound:WIN];
        self.status = WAS_HIT;
    }
}

-(void)step {
    
    self.sprite.rotation += 1;
    
    if (self.status == WAS_HIT) {
        [self disappear];
    }
}

-(void)disappear {
    
    if (self.sprite.opacity < 21) {
        self.sprite.opacity = 1;
    }else{
        self.sprite.opacity -= 20;
    }
    
    self.sprite.scale += 0.1;
    
    self.animation_dietime +=1;
    
    if (self.animation_dietime > 60) {
        self.status = IS_GONE;
    }
}

-(void)setX:(double)x {
    _x = x;
    self.sprite.position = ccp(x,self.sprite.position.y);
}

-(void)setY:(double)y {
    _y = y;
    self.sprite.position = ccp(self.sprite.position.x,y);
}

@end
