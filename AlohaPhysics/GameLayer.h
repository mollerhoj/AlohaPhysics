//
//  GameLayer.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 17/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"
#import "Game.h"

@interface GameLayer : CCLayer {
    b2World *world;
    GLESDebugDraw *m_debugDraw;
}

@property (nonatomic) Game *game;

// returns a CCScene that contains the GameLayer as the only child
+(CCScene *) scene;

@end
