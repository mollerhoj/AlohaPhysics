//
//  Game.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@implementation Game

#define PIXELS_TO_METER_RATIO 32
#define STEPS_PER_SECOND 60.0
#define VELOCITY_ITERATIONS 8
#define POSITION_ITERATIONS 1

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
- (void) step {
    self.level->world->Step(1.0/STEPS_PER_SECOND, VELOCITY_ITERATIONS, POSITION_ITERATIONS);
    self.level->hero->ApplyForce(b2Vec2(0.0f, -10.0f), self.level->hero->GetPosition());
}

@end
