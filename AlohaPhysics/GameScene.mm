//
//  GameScene.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 21/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

/*
 The game scene initializes background, graphic, sound and touch managers
 It also creates the game object.
*/

#import "GameScene.h"
#import "BackgroundLayer.h"
#import "GameLayer.h"
#import "Game.h"
#import "GraphicManager.h"
#import "SoundManager.h"

@implementation GameScene

@synthesize mainLayer = _mainLayer;

-(id)init {
    self = [super init];
    if (self != nil) {
        
        //Background Layer
        BackgroundLayer *backgroundLayer = [BackgroundLayer node];
        [self addChild:backgroundLayer z:0];
        
        //GraphicsLayer
        self.mainLayer = [CCLayer node];
        [self addChild:self.mainLayer];
        [GraphicManager sharedManager].layer = self.mainLayer;
        
        //Game object
        Game* game = [[Game alloc] init];
        
        //Gameplay Layer
        GameLayer *gameLayer = [GameLayer node];
        gameLayer.touchListener = game.level;
        gameLayer.stepListener = game;
        [self addChild:gameLayer z:5];
    }
    return self;
}

@end
