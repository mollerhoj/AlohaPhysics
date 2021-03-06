//
//  Level.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// The level (play board, game board) of the game. Handing creation and removal of objects.

#import "Level.h"
#import "LevelBuilder.h"
#import "Game.h"
#import "Graphicmanager.h"
#import "SoundManager.h"
#import "GameManager.h"

@interface Level ()
@property (nonatomic,assign) LevelBuilder *levelBuilder;
@property (nonatomic,assign) int currentLevel;
@end

@implementation Level

#define NUMBER_OF_LEVELS 15

@synthesize levelBuilder = _levelBuilder;
@synthesize currentLevel = _currentLevel;
@synthesize physicalObjects = _physicalObjects;

@synthesize maxTime = _maxTime;
@synthesize time = _time;
@synthesize playing = _playing;
@synthesize hero = _hero;
@synthesize goal = _goal;
@synthesize won = _won;

/*
 Init level in game
*/
-(id) init
{
	if( (self=[super init])) {
        //Define physical world
        [self defineWorld];

        //Init array
        self.physicalObjects = [[NSMutableArray alloc] init];
        
        //Init levelBuilder
        self.levelBuilder = [[LevelBuilder alloc] initWithLevel:self];

        self.currentLevel = 1;
        
        //Build level 1 as default
        [self.levelBuilder buildLevel:self.currentLevel];
	}
	return self;
}

//Destroy Level
-(void)destroyLevel
{
    //Remove all sprites from graphics
	[[GraphicManager sharedManager] removeGraphics];
    
    //Iterate over the bodies in the physics world and delete them
    for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
	{
		world->DestroyBody(b);
	}
    
    [self.physicalObjects removeAllObjects];
    
    self.time = 0;
    self.won = NO;
}

//Restart level
-(void)restartLevel
{
    [[SoundManager sharedManager] playSound:DIE];
    [self destroyLevel];
    [self.levelBuilder buildLevel:self.currentLevel];
}

//Makes next level
-(void)nextLevel
{
    [self destroyLevel];
    self.currentLevel++;
    
    if (self.currentLevel < NUMBER_OF_LEVELS) {
        [self.levelBuilder buildLevel:self.currentLevel];
    }else{
        [[GameManager sharedManager] replaceScene:EndSceneEnum];
    }
}

/*
 Define the physical world
*/
-(void) defineWorld 
{
    // Define the gravity vector.
    b2Vec2 gravity;
    gravity.Set(0.0f, -16.0f);
    
    // Do we want to let bodies sleep?
    // This will speed up the physics simulation
    bool doSleep = true;
    
    // Construct a world object, which will hold and simulate the rigid bodies.
    world = new b2World(gravity, doSleep);
    
    world->SetContinuousPhysics(true);
}
@end
