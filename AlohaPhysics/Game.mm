//
//  Game.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "Mechanic.h"

@interface Game ()

@property (nonatomic,assign) Mechanic *mechanic;

@end

static int _unit;

@implementation Game

#define STEPS_PER_SECOND 60.0
#define VELOCITY_ITERATIONS 8
#define POSITION_ITERATIONS 1

//@synthesize scene = _scene;
@synthesize level = _level;
@synthesize mechanic = _mechanic;

/*
 init game with a level
*/
- (id) init {
    if( (self=[super init])) {
		self.mechanic = [[Mechanic alloc] init];
        self.level = [[Level alloc] init];
    }
    return self;
}

/*
 The game loop
*/
- (void) step {
    
    if(self.level.playing)
    {
        if(self.level.time < self.level.maxTime)
        {
            //Increase time if max isn't reached
            self.level.time++;
            
            //Check wether individual object has reached own max time
            for (b2Body* body = self.level->world->GetBodyList(); body; body = body->GetNext())
            {
                MoveableObject *mo = (MoveableObject*)body->GetUserData();
                if(self.level.time <= mo.maxTimePlay) 
                {
                    //Play moveable object
                    [self.mechanic playMechanicType:mo.mechanicType withBody:body];
                } else {
                    //Stop moveable object
                    [self.mechanic stopMovementForBody:body];
                }
            }
        } else {
            //Stop moveable objects when max time is reached
            for (b2Body* body = self.level->world->GetBodyList(); body; body = body->GetNext())
            {
                [self.mechanic stopMovementForBody:body];
            }
        }
    } else {
        if(self.level.time > 0)
        {
            //Decrease time until default is reached
            self.level.time--;
            
            //Check wether individual object...
            for (b2Body* body = self.level->world->GetBodyList(); body; body = body->GetNext())
            {
                MoveableObject *mo = (MoveableObject*)body->GetUserData();
                if(self.level.time >= mo.maxTimePlay) 
                {
                    //Stop moveable object
                    [self.mechanic stopMovementForBody:body];
                } else {
                    //Rewind moveable object
                    [self.mechanic rewindMechanicType:mo.mechanicType withBody:body];
                }
            }
        } else {
            //Stop moveable objects when default is reached
            for (b2Body* body = self.level->world->GetBodyList(); body; body = body->GetNext())
            {
                [self.mechanic stopMovementForBody:body];
            }
        }
    }
    
    //Make worlds step
    self.level->world->Step(1.0/STEPS_PER_SECOND, VELOCITY_ITERATIONS, POSITION_ITERATIONS);
    
    //Loop through levels physical objects and update them
    
    
    //Check if hero is out of the frame
    if (!self.level.won) {
        b2Vec2 heroPosition = self.level.hero->GetPosition();
        if(heroPosition.x < -0.5 || heroPosition.x > 15.5 || heroPosition.y < -0.5 || heroPosition.y > 12.5) 
        {
            [self.level restartLevel];
        }
    }

    //Check if the hero reaches within radius 0.8 to goal
    b2Vec2 locationHero = self.level.hero->GetWorldCenter();
    if(ccpDistance(CGPointMake(locationHero.x, locationHero.y), CGPointMake(self.level.goal.x, self.level.goal.y)) < 0.8f)
    {
        [self.level.goal hit];
        self.level.won = true;
    }
    
    //TODO: Use a listener and remove this from game loop
    if (self.level.goal.status == IS_GONE) {
        [self.level nextLevel];
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
