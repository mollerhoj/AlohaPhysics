//
//  LevelBuilder.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelBuilder.h"
#import "Game.h"
#import "MoveableObject.h"

@implementation LevelBuilder

@synthesize level = _level;

-(id)initWithLevel:(Level *)level
{
	if( (self=[super init])) {
        self.level = level;
	}
	return self;
}

-(void)buildLevel:(int)levelNumber {
    switch (levelNumber) {
        case 1:
            [self addKinematicBoxWithCoords:CGPointMake(320.0, 100.0) withDimensionX:1.5 andY:1.0 withAngle:0.0 andMechanicType:2];
            [self addKinematicBoxWithCoords:CGPointMake(150.0, 150.0) withDimensionX:3.5 andY:0.5 withAngle:-0.1 andMechanicType:1];
            [self addHeroWithCoords:CGPointMake(100.0, 200.0)];
            [self addGoalWithCoords:CGPointMake(430.0, 50.0)];
            break;
            
        case 2:
            [self addKinematicBoxWithCoords:CGPointMake(320.0, 100.0) withDimensionX:1.5 andY:1.0 withAngle:0.1 andMechanicType:2];
            [self addKinematicBoxWithCoords:CGPointMake(150.0, 150.0) withDimensionX:2.5 andY:0.5 withAngle:-0.1 andMechanicType:1];
            [self addHeroWithCoords:CGPointMake(100.0, 200.0)];
            [self addGoalWithCoords:CGPointMake(430.0, 50.0)];
            break;
            
        default:
            break;
    }
    
}

//Add a kinetic box to the physical world
-(void)addKinematicBoxWithCoords:(CGPoint)p 
                  withDimensionX:(CGFloat)x 
                            andY:(CGFloat)y 
                       withAngle:(CGFloat)a 
                 andMechanicType:(int) mT
{
	//Define the kinetic body
    //Set up a 1m squared box in the physics world
	b2BodyDef bodyDef;
    bodyDef.type = b2_kinematicBody; //Kinetic static body
    bodyDef.angle = a; //Define angle
    
	bodyDef.position.Set(p.x/32, p.y/32);
	
    MoveableObject *moveableObject = [[MoveableObject alloc] init];
    moveableObject.mechanicType = mT;
    bodyDef.userData = moveableObject;
	
    b2Body *body = self.level->world->CreateBody(&bodyDef);
	
	// Define another box shape for our dynamic body.
	b2PolygonShape kinematicBox;
	kinematicBox.SetAsBox(x, y);//These are mid points for our 1m box
	
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &kinematicBox;	
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.3f;
	body->CreateFixture(&fixtureDef);
}

-(void)addHeroWithCoords:(CGPoint)p
{
    // Define the dynamic body.
	//Set up a circle in the physics world
	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
    
	bodyDef.position.Set(p.x/32, p.y/32);
	//bodyDef.userData = sprite;
    
    // Construct a hero and set it to levels hero
    self.level.hero = self.level->world->CreateBody(&bodyDef);
    //b2Body *body = self.level->world->CreateBody(&bodyDef);
	
	// Define another circle shape for our dynamic body.
    b2CircleShape dynamicCircle;
	dynamicCircle.m_radius = 0.5; //Sets the radius of the circle
	
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicCircle;
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.3f;
	self.level.hero->CreateFixture(&fixtureDef);
    //body->CreateFixture(&fixtureDef);
}

-(void)addGoalWithCoords:(CGPoint)p
{
	self.level.goal = p;
}

@end
