//
//  Hero.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 23/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// The hero (main character, player) of the game, also a physical object (A ball).

#import "Hero.h"
#import "GraphicManager.h"
#import "cocos2d.h"
#import "Box2D.h"
#import "Game.h"

@implementation Hero

#define PICTURE HERO

@synthesize sprite = _sprite;
@synthesize x = _x;
@synthesize y = _y;
@synthesize physicalBody = _physicalBody;

-(id)init {
    self = [super init];
    if (self != nil) {
        self.sprite = [[GraphicManager sharedManager] createSpriteFromPicture:PICTURE];
    }
    return self;
}

-(void)step {
    b2Vec2 worldPosition = self.physicalBody->GetWorldCenter();
    self.x = worldPosition.x;
    self.y = worldPosition.y;
    
    self.sprite.rotation = self.physicalBody->GetAngle()/M_PI*-(180);
}


-(void)setX:(double)x {
    _x = x;
    self.sprite.position = ccp(x*32,self.sprite.position.y);
}

-(void)setY:(double)y {
    _y = y;
    self.sprite.position = ccp(self.sprite.position.x,y*32);
}

@end
