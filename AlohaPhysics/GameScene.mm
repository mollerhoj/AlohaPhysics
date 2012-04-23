//
//  GameScene.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 21/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"
#import "BackgroundLayer.h"
#import "GameLayer.h"
#import "Game.h"
#import "GraphicLayer.h"
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
        NSAssert([CCDirector sharedDirector].winSize.width/15 == [CCDirector sharedDirector].winSize.height/10,@"The ratio between width and height is not right");
        
        //Background Layer
        BackgroundLayer *backgroundLayer = [BackgroundLayer node];
        [self addChild:backgroundLayer z:0];
        
        //Game object
        self.game = [[Game alloc] init];
        
        GraphicLayer* gl = [GraphicLayer sharedLayer];
        
        //GraphicsLayer
        [self addChild:gl z:2];
        
        //Gameplay Layer
        GameLayer *gameLayer = [GameLayer node];
        gameLayer.touchListener = self.game.level;
        gameLayer.stepListener = self.game;
        [self addChild:gameLayer z:5];
        
        //Setup soundmanager
        [[SoundManager sharedManager] setup];
        
    }
    return self;
}

@end
