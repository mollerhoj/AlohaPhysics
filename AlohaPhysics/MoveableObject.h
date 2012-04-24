//
//  MoveableObject.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"

@interface MoveableObject : NSObject

@property (nonatomic, assign) int mechanicType;
@property (nonatomic, assign) CCSprite *image;
@property (nonatomic, assign) int maxTimePlay;
@property (nonatomic,assign) b2Vec2 position;
@property (nonatomic,assign) b2Body *physicalBody;

-(void)step;

@end
