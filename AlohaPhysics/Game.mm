//
//  Game.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "Mechanic.h"

@implementation Game

#define PIXELS_TO_METER_RATIO 32
#define STEPS_PER_SECOND 60.0
#define VELOCITY_ITERATIONS 8
#define POSITION_ITERATIONS 1

@synthesize level = _level;
@synthesize mechanic = _mechanic;

/*
 init game with a level
*/
- (id) init {
    if( (self=[super init])) {
        self.level = [[Level alloc] init];
        self.mechanic = [[Mechanic alloc] init];
    }
    return self;
}

/*
 The game loop
*/
- (void) step {
    
    //Make moveable objects move (play) if touched and held, when release rewind moveable objects to default position 
    if(self.level.playing)
    {
        if(self.level.time != self.level.maxTime)
        {
            //Increase time if max isn't reached
            self.level.time++;
            
            //Play moveable objects
            for (b2Body* body = self.level->world->GetBodyList(); body; body = body->GetNext())
            {
                MoveableObject *mo = (MoveableObject*)body->GetUserData();
                [self.mechanic playMechanicType:mo.mechanicType withBody:body];
            }
        } else {
            //Stop moveable objects when max time is reached
            for (b2Body* body = self.level->world->GetBodyList(); body; body = body->GetNext())
            {
                [self.mechanic stopMovementForBody:body];
            }
        }
    } else {
        if(self.level.time != 0)
        {
            //Decrease time until default is reached
            self.level.time--;
            
            //Rewind moveable objects
            for (b2Body* body = self.level->world->GetBodyList(); body; body = body->GetNext())
            {
                MoveableObject *mo = (MoveableObject*)body->GetUserData();
                [self.mechanic rewindMechanicType:mo.mechanicType withBody:body];
            }
        } else {
            //Stop moveable objects when default is reached
            for (b2Body* body = self.level->world->GetBodyList(); body; body = body->GetNext())
            {
                [self.mechanic stopMovementForBody:body];
            }
        }
    }
    
    self.level->world->Step(1.0/STEPS_PER_SECOND, VELOCITY_ITERATIONS, POSITION_ITERATIONS);
    
    //Check if hero is out of the frame
    b2Vec2 heroPosition = self.level->hero->GetPosition();
    if(heroPosition.x < 0.0 || heroPosition.x > 15.0 || heroPosition.y < 0.0 || heroPosition.y > 10.0) 
    {
        [self.level restartLevel];
    }

    //Check if the hero reaches the goal
    if(self.level->hero->GetFixtureList()->GetShape() != nil) {
        if(self.level->hero->GetFixtureList()->GetShape()->TestPoint(self.level->hero->GetTransform(), b2Vec2(self.level->goal.x/PIXELS_TO_METER_RATIO, self.level->goal.y/PIXELS_TO_METER_RATIO))) 
        {
            [self.level nextLevel];
        }
    }
}

@end
