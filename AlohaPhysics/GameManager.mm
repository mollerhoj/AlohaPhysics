//
//  GameManager.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 28/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//  Handling what scenes to show, globally accessable singleton

#import "GameManager.h"
#import "GameScene.h"
#import "cocos2d.h"
#import "Game.h"
#import "SoundManager.h"
#import "GraphicManager.h"
#import "LevelSelectScene.h"

@interface GameManager()

@property (nonatomic, assign) CCScene* gameScene;
@property (nonatomic, assign) CCScene* levelSelectScene;

@end

@implementation GameManager

@synthesize gameScene = _gameScene;
@synthesize levelSelectScene = _levelSelectScene;

static GameManager* sharedManager;

//Access singleton
+(GameManager*) sharedManager
{
	@synchronized(self)     {
		if (!sharedManager)
			sharedManager = [[GameManager alloc] init];
	}
	return sharedManager;
}

//Init the different scenes
-(id)init {
    self = [super init];
    if (self != nil) {
        
        //Set the unit of the game
        [Game setUnit:(int)[CCDirector sharedDirector].winSize.width/15];
        
        //Setup soundmanager
        //Outcommit so that I will not go crazy from the music!
        [[SoundManager sharedManager] setup];
        
        [GraphicManager sharedManager].font = @"Quicksand";
        
        self.gameScene = [GameScene node];
        self.levelSelectScene = [LevelSelectScene node];
    }
    return self;
}

//Start the game
-(void)startGame {
    //Run the first scene of the game
    [self runScene:GameSceneEnum];
}

-(CCScene*)ScenesEnumToScene:(Scenes)scene
{
    switch (scene) {
        case GameSceneEnum:
            return self.gameScene;
            break;
        case LevelSelectSceneEnum:
            return self.levelSelectScene;
            break;
            
        default:
            break;
    }
    return nil;
}

//Run this scene!
-(void)runScene:(Scenes)scene {
    [[CCDirector sharedDirector] runWithScene:[self ScenesEnumToScene:scene]];
}

//Push this scene!
-(void)pushScene:(Scenes)scene {
    [[CCDirector sharedDirector] pushScene:[self ScenesEnumToScene:scene]];
}

//Push this scene!
-(void)popScene {
    [[CCDirector sharedDirector] popScene];
}

//Replace this scene!
-(void)replaceScene:(Scenes)scene {
    [[CCDirector sharedDirector] replaceScene:[self ScenesEnumToScene:scene]];
}

@end
