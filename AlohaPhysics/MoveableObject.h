//
//  MoveableObject.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MoveableObject : NSObject

@property (nonatomic, assign) int mechanicType;
@property (nonatomic, assign) CCSprite *image;
@property (nonatomic, assign) int maxTimePlay;

@end
