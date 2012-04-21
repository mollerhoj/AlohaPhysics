//
//  LevelBuilder.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelBuilder.h"

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
            [self addStaticBoxWithCoords:CGPointMake(320.0, 100.0) withDimensionX:1.5 andY:1.0 withAngle:0.0];
            [self addStaticBoxWithCoords:CGPointMake(150.0, 150.0) withDimensionX:3.5 andY:0.5 withAngle:-0.1];
            [self addHeroWithCoords:CGPointMake(100.0, 200.0) andRadius:0.5];
            break;
            
        case 2:
            //DO SHIT
            break;
            
        default:
            break;
    }
}

//Add a box to the physical world
-(void)addStaticBoxWithCoords:(CGPoint)p withDimensionX:(CGFloat)x andY:(CGFloat)y withAngle:(CGFloat)a
{
	//Set up a 1m squared box in the physics world
	b2BodyDef bodyDef;
    bodyDef.type = b2_staticBody; //Define static body
    bodyDef.angle = a; //Define angle
    
	bodyDef.position.Set(p.x/32, p.y/32);
	//bodyDef.userData = sprite;
	b2Body *body = self.level->world->CreateBody(&bodyDef);
	
	// Define another box shape for our dynamic body.
	b2PolygonShape dynamicBox;
	dynamicBox.SetAsBox(x, y);//These are mid points for our 1m box
	
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicBox;	
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.3f;
	body->CreateFixture(&fixtureDef);
}

-(void)addHeroWithCoords:(CGPoint)p andRadius:(CGFloat)r
{
    NSLog(@"Defines the hero");
    
    // Define the dynamic body.
	//Set up a 1m squared box in the physics world
	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
    
	bodyDef.position.Set(p.x/32, p.y/32);
	//bodyDef.userData = sprite;
    
    // Construct a hero and set it to levels hero
    self.level->hero = self.level->world->CreateBody(&bodyDef);
	
	// Define another circle shape for our dynamic body.
    b2CircleShape dynamicCircle;
	dynamicCircle.m_radius = r; //Sets the radius of the circle
	
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicCircle;
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.3f;
	self.level->hero->CreateFixture(&fixtureDef);
}

@end
