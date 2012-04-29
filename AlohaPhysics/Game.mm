//
//  Game.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//The game

#import "Game.h"
#import "MoveableObject.h"

@interface Game ()

-(void)moveAndStopPhysicalObjects;
-(void)heroReachedGoal;
-(void)heroOutOfFrame;
-(void)updatePhysicalObjects;

@end

static int _unit;

@implementation Game

#define STEPS_PER_SECOND 60.0
#define VELOCITY_ITERATIONS 8
#define POSITION_ITERATIONS 1

//@synthesize scene = _scene;
@synthesize level = _level;

/*
 init game with a level
*/
- (id) init {
    if( (self=[super init])) {
        self.level = [[Level alloc] init];
    }
    return self;
}

/*
 The game loop
*/
- (void) step 
{    
    [self moveAndStopPhysicalObjects];
    
    //Make worlds step
    self.level->world->Step(1.0/STEPS_PER_SECOND, VELOCITY_ITERATIONS, POSITION_ITERATIONS);
    
    //Run through goal's and hero step //TODO: Make this general for all GameObjects
    [self.level.goal step];
    [self.level.hero step];
    
    [self heroReachedGoal];
    [self heroOutOfFrame];
    [self updatePhysicalObjects];
    
    //TODO: Use a listener and remove this from game loop
    if (self.level.goal.status == IS_GONE) {
        [self.level nextLevel];
    }
}

//Check if the hero reaches within radius 0.8 to goal
-(void)heroReachedGoal
{
    if(ccpDistance(CGPointMake(self.level.hero.x, self.level.hero.y), CGPointMake(self.level.goal.x/[Game unit], self.level.goal.y/[Game unit])) < 0.8f)
    {
        [self.level.goal hit];
        self.level.won = true;
    }
}

//Check if hero is out of the frame
-(void)heroOutOfFrame
{
        if (!self.level.won) {
        if(self.level.hero.x < -0.5 || self.level.hero.x > 15.5 || self.level.hero.y < -0.5 || self.level.hero.y > 12.5) 
        {
            [self.level restartLevel];
        }
    }
}

//Loop through all physical objects in level and update them
-(void)updatePhysicalObjects
{
    for (MoveableObject *pObject in self.level.physicalObjects)
    {
        [pObject step];
    }
}

//Move and stop physical objects
-(void)moveAndStopPhysicalObjects
{
    if(self.level.playing)
    {
        if(self.level.time < self.level.maxTime)
        {
            //Increase time if max isn't reached
            self.level.time++;
            
            //Check wether individual object has reached own max time
            for (MoveableObject *pObject in self.level.physicalObjects)
            {
                if(self.level.time <= pObject.maxTimePlay) 
                {
                    //Play moveable object
                    [pObject.mechanic playMechanicWithBody:pObject.physicalBody];
                } else {
                    //Stop moveable object
                    [pObject.mechanic stopMovementForBody:pObject.physicalBody];
                }
            }
        } else {
            //Stop moveable objects when max time is reached
            for (MoveableObject *pObject in self.level.physicalObjects)
            {
                [pObject.mechanic stopMovementForBody:pObject.physicalBody];
            }
        }
    } else {
        if(self.level.time > 0)
        {
            //Decrease time until default is reached
            self.level.time--;
            
            //Check wether individual object...
            for (MoveableObject *pObject in self.level.physicalObjects)
            {
                if(self.level.time >= pObject.maxTimePlay) 
                {
                    //Stop moveable object
                    [pObject.mechanic stopMovementForBody:pObject.physicalBody];
                } else {
                    //Rewind moveable object
                    [pObject.mechanic rewindMechanicWithBody:pObject.physicalBody];
                }
            }
        } else {
            //Stop moveable objects when default is reached
            for (MoveableObject *pObject in self.level.physicalObjects)
            {
                [pObject.mechanic stopMovementForBody:pObject.physicalBody];
            }
        }
    }
}

/*
 The unit used in the game. The size of the screen is always 15x10 units.
*/
+ (int) unit {
    return _unit;
}

/*
 Define the unit of the game
*/
+ (void)setUnit:(int)ppu {
    _unit = ppu;
}

@end
