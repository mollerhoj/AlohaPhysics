//
//  GameManager.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 28/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameManager.h"
#import "GameScene.h"

@interface GameManager()

@property (nonatomic, assign) CCScene* gameScene;

@end

@implementation GameManager

@synthesize gameScene;

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
        self.gameScene = [GameScene node];
        
    }
    return self;
}

//Start the game
-(void)startGame {
    //Run the first scene of the game
    [self runScene:GameSceneEnum];
}

//Run this scene!
-(void)runScene:(Scenes)scene {
    switch (scene) {
        case GameSceneEnum:
            [[CCDirector sharedDirector] runWithScene:self.gameScene];
            break;
            
        default:
            break;
    }
}

@end
