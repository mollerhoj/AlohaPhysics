//
//  Level.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "Box2D.h"
#import <Foundation/Foundation.h>
#import "GraphicLayer.h"
#import "Goal.h"

@interface Level : NSObject {
    @public
    b2World *world;
}

@property (nonatomic,assign) b2Body *hero;
@property (nonatomic,assign) Goal *goal;
@property (nonatomic,assign) GraphicLayer *graphicLayer;

@property (nonatomic, assign) double maxTime;
@property (nonatomic, assign) BOOL playing;
@property (nonatomic, assign) int time;


-(void)nextLevel;
-(void)restartLevel;
@end
