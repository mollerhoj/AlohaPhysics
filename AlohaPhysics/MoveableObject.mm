//
//  MoveableObject.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MoveableObject.h"
#import "cocos2d.h"
#import "Box2D.h"

@implementation MoveableObject

@synthesize mechanic = _mechanic;
@synthesize image = _image;
@synthesize maxTimePlay = _maxTimePlay;
@synthesize position = _position;
@synthesize physicalBody = _physicalBody;

//Update your own position
-(void)step
{
    self.position = self.physicalBody->GetWorldCenter();
}

@end
