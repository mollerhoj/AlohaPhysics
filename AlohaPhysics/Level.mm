//
//  Level.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Level.h"
#import "LevelBuilder.h"
#import "Game.h"
#import "GraphicLayer.h"

@interface Level ()
@property (nonatomic,assign) Game *game;
@property (nonatomic,assign) LevelBuilder *levelBuilder;
@property (nonatomic,assign) int *currentLevel;
@property (nonatomic,assign) double *touchTime;
@property (nonatomic,assign) double *maxTouchTime;
@property (nonatomic,assign) BOOL *touching;
@property (nonatomic,assign) CCLayer *graphicLayer;
@end

@implementation Level

@synthesize levelBuilder = _levelBuilder;
@synthesize currentLevel = _currentLevel;
@synthesize touchTime = _touchTime;
@synthesize maxTouchTime = _maxTouchTime;
@synthesize touching = _touching;
@synthesize game = _game;
@synthesize graphicLayer = _graphicLayer;

/*
 Init level in game
*/
-(id) initInGame:(Game *)game
{
	if( (self=[super init])) {
        //Set the game this level is part of
        self.game = game;
        
        //Define physical world
        [self defineWorld];
        
        self.graphicLayer = self.game.scene.graphicLayer;
        
        //Init levelBuilder
        self.levelBuilder = [[LevelBuilder alloc] init];
        
	}
	return self;
}

/*
 Define the physical world
*/
-(void)defineWorld {
    // Define the gravity vector.
    b2Vec2 gravity;
    gravity.Set(0.0f, -10.0f);
    
    // Do we want to let bodies sleep?
    // This will speed up the physics simulation
    bool doSleep = true;
    
    // Construct a world object, which will hold and simulate the rigid bodies.
    world = new b2World(gravity, doSleep);
    
    world->SetContinuousPhysics(true);
}


//Simple box adding test
-(void) addNewBoxWithCoords:(CGPoint)p
{
	// Define the dynamic body.
	//Set up a 1m squared box in the physics world
	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
    
	bodyDef.position.Set(p.x/32, p.y/32);
	//bodyDef.userData = sprite;
	b2Body *body = world->CreateBody(&bodyDef);
	
	// Define another box shape for our dynamic body.
	b2PolygonShape dynamicBox;
	dynamicBox.SetAsBox(.5f, .5f);//These are mid points for our 1m box
	
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicBox;	
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.3f;
	body->CreateFixture(&fixtureDef);
}

@end
