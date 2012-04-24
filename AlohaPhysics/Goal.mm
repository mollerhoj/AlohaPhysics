//
//  Goal.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Goal.h"
#import "GraphicLayer.h"
#import "SoundManager.h"

@interface Goal ()

-(void)disappear;

@end

@implementation Goal

#define PICTURE GOAL

@synthesize sprite = _sprite;
@synthesize status = _status;
@synthesize x = _x;
@synthesize y = _y;

-(id)init {
    self = [super init];
    if (self != nil) {
        self.sprite = [[GraphicLayer sharedLayer] createSpriteFromPicture:PICTURE];
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
    if (self.status == WAS_HIT) {
        [self disappear];
    }
}

-(void)disappear {
    self.sprite.opacity -= 5;
    
    if (self.sprite.opacity <= 0) {
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
