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

@interface Level : NSObject {
    @public
    b2World *world;
    b2Body *hero;
}
@end
