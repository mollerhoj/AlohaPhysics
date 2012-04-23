//
//  Goal.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Goal.h"
#import "GraphicLayer.h"

@interface Goal ()

@end

@implementation Goal

#define PICTURE GOAL

@synthesize sprite = _sprite;
@synthesize wasHit = _wasHit;
@synthesize x = _x;
@synthesize y = _y;

-(id)init {
    self = [super init];
    if (self != nil) {
        self.sprite = [[GraphicLayer sharedLayer] createSpriteFromPicture:PICTURE];
        self.sprite.position = ccp(0,0);
    }
    return self;
}

-(void)step {
    if (self.wasHit) {
        [self disappear];
    }
}

/*-(void)disappear {
    self.sprite.opacity -= 0.05;
    
    if (self.sprite.opacity <= 0) {
        //DESTROY;
    }
}*/

-(void)setX:(double)x {
    _x = x;
    self.sprite.position = ccp(x,self.sprite.position.y);
}

-(void)setY:(double)y {
    _y = y;
    self.sprite.position = ccp(self.sprite.position.x,y);
}

@end
