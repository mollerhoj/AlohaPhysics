//
//  Hero.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 23/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "Box2D.h"

@interface Hero : NSObject

@property (nonatomic,assign) CCSprite* sprite;
@property (nonatomic,assign) double x;
@property (nonatomic,assign) double y;
@property (nonatomic,assign) b2Body *physicalBody;

-(void)step;

@end
