//
//  Game.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@implementation Game


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
}

/*
 The unit used in the game. The size of the screen is always 15x10 units.
*/
+ (int) unit {
    return self.unit;
}

/*
 Define the unit of the game
*/
+ (void)setUnit:(int)pixel_per_unit {
    self.unit = pixel_per_unit;
};

@end
