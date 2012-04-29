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

@interface GameScene ()
@property (nonatomic,assign) Game *game;
@end

@implementation GameScene

@synthesize game = _game;

-(id)init {
    self = [super init];
    if (self != nil) {
        
        //Set the unit of the game
        [Game setUnit:(int)[CCDirector sharedDirector].winSize.width/15];
        
        //Setup soundmanager
        //Outcommit so that I will not go crazy from the music!
        [[SoundManager sharedManager] setup];
        
        //Background Layer
        BackgroundLayer *backgroundLayer = [BackgroundLayer node];
        [self addChild:backgroundLayer z:0];
        
        //Game object
        self.game = [[Game alloc] init];
        
    
        //GraphicsLayer
        CCLayer* mainLayer = [CCLayer node];
        [self addChild:mainLayer];
        [[GraphicManager sharedManager]setLayer:mainLayer];
        
        //Gameplay Layer
        GameLayer *gameLayer = [GameLayer node];
        gameLayer.touchListener = self.game.level;
        gameLayer.stepListener = self.game;
        [self addChild:gameLayer z:5];
    }
    return self;
}

@end
