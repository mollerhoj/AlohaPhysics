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

#define graphicsTag 1

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

/*
    Init Debug drawing: This method should be removed upon release
*/
-(void) initDebugDraw {
    //init the debug drawer with ratio
    m_debugDraw = new GLESDebugDraw([Game unit]);
    
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
        
        //Create the game object
        self.game = [[Game alloc] init];
        
        //Set the screen to be touchable
        self.isTouchEnabled = YES;
        
        //Set the unit of the game
        [Game setUnit:(int)[CCDirector sharedDirector].winSize.width/15];
        NSAssert([CCDirector sharedDirector].winSize.width/15 == [CCDirector sharedDirector].winSize.height/10,@"The ratio between width and height is not right");
        
        //Init debug drawing: Remove upon release
        [self initDebugDraw];

        //INIT GRAPICS
        CCSpriteBatchNode *batch = [CCSpriteBatchNode batchNodeWithFile:@"blocks.png" capacity:150];
		[self addChild:batch z:0 tag:graphicsTag];
        
        CCSpriteBatchNode *batch2 = (CCSpriteBatchNode*) [self getChildByTag:graphicsTag];
        
        CCSprite *sprite = [CCSprite spriteWithBatchNode:batch2 rect:CGRectMake(0,0,64,64)];
        [batch2 addChild:sprite];
        
        sprite.position = ccp( 32, 32);
        
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

/*
    Debug drawing: Remove upon release.
*/
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
- (void) dealloc
{
	delete m_debugDraw;

	[super dealloc];
}

@end
