//
//  GameLayer.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 17/04/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"
#import "Game.h"

@implementation GameLayer

@synthesize game = _game;
//@synthesize world = _world;
//@synthesize m_debugDraw = _m_debugDraw;

#define PIXELS_TO_METER_RATIO 32
#define STEPS_PER_SECOND 60.0
#define VELOCITY_ITERATIONS 8
#define POSITION_ITERATIONS 1

//Static method used to return a scene with this layer, in order to kick off the game
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) initProperties {
    self.isTouchEnabled = YES;
}

-(void) initSize {
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    CCLOG(@"Screen width %0.2f screen height %0.2f",screenSize.width,screenSize.height);
}

-(void) initDebugDraw {
    //init the debug drawer with ratio
    m_debugDraw = new GLESDebugDraw( PIXELS_TO_METER_RATIO );
    
    //Set the debug draw into the world
    self.game.level->world->SetDebugDraw(m_debugDraw);
    
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
        
        self.game = [[Game alloc] init];
        
        
        [self initProperties];
        [self initSize];
        [self initDebugDraw];

        //Create levelbuilder
        
        //Create gameplayJugde
        
        //Start scheduler
        [self schedule: @selector(tick:)];
		
	}
	return self;
}

//Tick
-(void) tick: (ccTime) dt
{
    [self.game step];
}

-(void) draw
{
	// Default GL states: GL_TEXTURE_2D, GL_VERTEX_ARRAY, GL_COLOR_ARRAY, GL_TEXTURE_COORD_ARRAY
	// Needed states:  GL_VERTEX_ARRAY, 
	// Unneeded states: GL_TEXTURE_2D, GL_COLOR_ARRAY, GL_TEXTURE_COORD_ARRAY
	glDisable(GL_TEXTURE_2D);
	glDisableClientState(GL_COLOR_ARRAY);
	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
	
	self.game.level->world->DrawDebugData();
	
	// restore default GL states
	glEnable(GL_TEXTURE_2D);
	glEnableClientState(GL_COLOR_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    
}

//Simple test function to test touches:
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	//Add a new body/atlas sprite at the touched location
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
		[self.game.level addNewBoxWithCoords: location];
	}
}

//DEALLOC, release all objects:
/*
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	delete world;
	world = NULL;
	
	delete m_debugDraw;
    
	// don't forget to call "super dealloc"
	[super dealloc];
}*/

@end
