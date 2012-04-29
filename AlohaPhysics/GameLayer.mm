//
//  GameLayer.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 17/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"
#import "Game.h"
#import "MoveableObject.h"

@implementation GameLayer

@synthesize stepListener = _stepListener;
@synthesize touchListener = _touchListener;

#define graphicsTag 1

-(void)setStepListener:(Game *)stepListener {
    _stepListener = stepListener;
    
    
    
    self.stepListener.level->world->SetDebugDraw(m_debugDraw);
}

/*
    Init Debug drawing: This method should be removed upon release
*/
-(void) initDebugDraw {
    //init the debug drawer with ratio
    m_debugDraw = new GLESDebugDraw([Game unit]*[[CCDirector sharedDirector]
                                                 contentScaleFactor]);
    
    //Set prefered flags for the debug draw
    uint32 flags = 0;
    flags += b2DebugDraw::e_shapeBit;
    //		flags += b2DebugDraw::e_jointBit;
    //		flags += b2DebugDraw::e_aabbBit;
    //		flags += b2DebugDraw::e_pairBit;
    //		flags += b2DebugDraw::e_centerOfMassBit;
    m_debugDraw->SetFlags(flags);		
}

//Called upon object creation
-(id) init
{
	if( (self=[super init])) {
        
        //Set the screen to be touchable
        self.isTouchEnabled = YES;
        
        //Init debug drawing: Remove upon release
        [self initDebugDraw];
        
        //Start scheduler
        [self schedule: @selector(tick:)];
		
	}
	return self;
}

//Tick
-(void) tick: (ccTime) dt
{
    [self.stepListener step];
}

/*
    Debug drawing: Remove upon release.
*/
-(void) draw
{
	if (self.stepListener) {
        // Default GL states: GL_TEXTURE_2D, GL_VERTEX_ARRAY, GL_COLOR_ARRAY, GL_TEXTURE_COORD_ARRAY
        // Needed states:  GL_VERTEX_ARRAY, 
        // Unneeded states: GL_TEXTURE_2D, GL_COLOR_ARRAY, GL_TEXTURE_COORD_ARRAY
        glDisable(GL_TEXTURE_2D);
        glDisableClientState(GL_COLOR_ARRAY);
        glDisableClientState(GL_TEXTURE_COORD_ARRAY);

            
        //self.stepListener.level->world->DrawDebugData();

        // restore default GL states
        glEnable(GL_TEXTURE_2D);
        glEnableClientState(GL_COLOR_ARRAY);
        glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    }
}

//Play moveable objects
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.touchListener.playing = YES;
}

//Rewind moveable objects
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.touchListener.playing = NO;
}

//DEALLOC, release all objects:
- (void) dealloc
{
	delete m_debugDraw;
	[super dealloc];
}

@end
