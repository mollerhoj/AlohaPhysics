//
//  Goal.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Goal : NSObject

enum {
    ALIVE,
    WAS_HIT,
    IS_GONE
} typedef Status;

@property Status status;
@property (nonatomic,assign) CCSprite* sprite;
@property (nonatomic,assign) double x;
@property (nonatomic,assign) double y;

-(void)step;

-(void)hit;

@end
