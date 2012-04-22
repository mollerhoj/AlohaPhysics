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
#import "Level.h"


@interface GameLayer : CCLayer {
    GLESDebugDraw *m_debugDraw;
}

//TODO: Use interfaces for these things, this code in not very generic right now.

@property (nonatomic,assign) Game *stepListener;
@property (nonatomic,assign) Level *touchListener;

@end
