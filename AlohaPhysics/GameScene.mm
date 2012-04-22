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

@interface GameScene ()
@property (nonatomic,assign) Game *game;
@end

@implementation GameScene

@synthesize game = _game;
@synthesize graphicLayer = _graphicLayer;

-(id)init {
    self = [super init];
    if (self != nil) {
        
        //Set the unit of the game
        [Game setUnit:(int)[CCDirector sharedDirector].winSize.width/15];
        NSAssert([CCDirector sharedDirector].winSize.width/15 == [CCDirector sharedDirector].winSize.height/10,@"The ratio between width and height is not right");
        
        // Background Layer
        BackgroundLayer *backgroundLayer = [BackgroundLayer node];
        [self addChild:backgroundLayer z:0];
        
        //Create the game object
        self.game = [[Game alloc] initWithScene:self];
        
        // Gameplay Layer
        GameLayer *gameLayer = [GameLayer node];
        
        //gameLayer.addTouchListener()
        gameLayer.stepListener = self.game;
        
        // Graphic Layer
        self.graphicLayer = [GraphicLayer node];
        
        [self addChild:gameLayer z:5];
    }
    return self;
}

-(void)setGraphicLayer:(CCLayer *)graphicLayer {
    _graphicLayer = graphicLayer;
    [self addChild:graphicLayer z:2];
}

@end
