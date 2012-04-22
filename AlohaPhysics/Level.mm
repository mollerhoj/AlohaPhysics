//
//  Level.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Level.h"
#import "LevelBuilder.h"

@interface Level ()
@property (nonatomic,assign) LevelBuilder *levelBuilder;
@property (nonatomic,assign) int currentLevel;
@property (nonatomic,assign) double *touchTime;
@property (nonatomic,assign) double *maxTouchTime;
@property (nonatomic,assign) BOOL *touching;
@end

@implementation Level

@synthesize levelBuilder = _levelBuilder;
@synthesize currentLevel = _currentLevel;
@synthesize touchTime = _touchTime;
@synthesize maxTouchTime = _maxTouchTime;
@synthesize touching = _touching;


/*
 Init level
 Setup the physics
 Init levelbuilder
*/
-(id) init
{
	if( (self=[super init])) {
        //Define physical world
        [self defineWorld];
        
        //Init levelBuilder
        self.levelBuilder = [[LevelBuilder alloc] initWithLevel:self];

        self.currentLevel = 1;
        
        //Build level 1 as default
        [self.levelBuilder buildLevel:self.currentLevel];
	}
	return self;
}

//Iterate over the bodies in the physics world and delete them
-(void)destroyLevel
{
	for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
	{
		world->DestroyBody(b);
	}
}

//Restart level
-(void)restartLevel
{
    [self destroyLevel];
    [self.levelBuilder buildLevel:self.currentLevel];
}

//Makes next level
-(void)nextLevel
{
    [self destroyLevel];
    self.currentLevel++;
    [self.levelBuilder buildLevel:self.currentLevel];
}

/*
 Define the physical world
*/
-(void) defineWorld 
{
    // Define the gravity vector.
    b2Vec2 gravity;
    gravity.Set(0.0f, -20.0f);
    
    // Do we want to let bodies sleep?
    // This will speed up the physics simulation
    bool doSleep = true;
    
    // Construct a world object, which will hold and simulate the rigid bodies.
    world = new b2World(gravity, doSleep);
    
    world->SetContinuousPhysics(true);
}
@end
