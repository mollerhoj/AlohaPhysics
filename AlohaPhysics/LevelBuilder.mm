//
//  LevelBuilder.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelBuilder.h"
#import "Game.h"

@implementation LevelBuilder

@synthesize level = _level;

-(id) initWithLevel:(Level *)level
{
	if( (self=[super init])) {
        self.level = level;
	}
	return self;
}

-(void)buildLevel:(int)levelNumber {
    switch (levelNumber) {
        case 1:
            //DO SHIT
            //[self.level addObject]
            break;
            
        case 2:
            //DO SHIT
            break;
            
        default:
            break;
    }
    
}

@end
