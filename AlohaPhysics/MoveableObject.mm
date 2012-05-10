//
//  MoveableObject.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// A physical object

#import "MoveableObject.h"
#import "cocos2d.h"
#import "Box2D.h"

@implementation MoveableObject

@synthesize mechanic = _mechanic;
@synthesize image = _image;
@synthesize maxTimePlay = _maxTimePlay;
@synthesize position = _position;
@synthesize physicalBody = _physicalBody;

@synthesize sprite = _sprite;
@synthesize x = _x;
@synthesize y = _y;
@synthesize angle = _angle;
@synthesize center = _center;

//Update your own position
-(void)step
{
    b2Vec2 worldPosition = self.physicalBody->GetWorldCenter();
    float worldAngle = self.physicalBody->GetAngle()+self.angle;
    
    double d = ccpDistance(ccp(0,0),ccp(self.center.x,self.center.y));
    double v = atan2(self.center.y, self.center.x)+self.physicalBody->GetAngle();
    self.sprite.rotation = (worldAngle)/M_PI*-(180);
    self.x = (worldPosition.x+cos(v)*d)*32;
    self.y = (worldPosition.y+sin(v)*d)*32;
    
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
