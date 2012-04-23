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
#import "Box2D.h"

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
        case 1: { //(These are nessary when defining new objects in switch statement)
            //Setting max frames for a moveable object to move
            self.level.maxTime = 40;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(150.0, 150.0) withDimensionX:2.5 andY:0.5 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:1 andMaxTimePlay:self.level.maxTime];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(100.0, 300.0)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(290.0, 30.0)];
            
            //Writing an introduction
            CCLabelTTF* intro = [self.level.graphicLayer createText:@"Welcome to Aloha Physics!"];
            intro.position = ccp(240,280);
            
            //Writing an instruction
            CCLabelTTF* instruction = [self.level.graphicLayer createText:@"Press the screen to start!"];
            instruction.position = ccp(240,230);
            
        } //(These are nessary when defining new objects in switch statement)
            break;
        
        case 2:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 50;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(100.0, 75.0) withDimensionX:2.0 andY:0.5 withAngle:-0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:2 andMaxTimePlay:self.level.maxTime];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(100.0, 250.0)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(320.0, 250.0)];
            
            break;
        
        case 3:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 20;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(86.0, 150.0) withDimensionX:3.5 andY:0.3 withAngle:0.0 andCenter:b2Vec2(2.0, 0.0) andMechanicType:3 andMaxTimePlay:20];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(100.0, 200.0)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(460.0, 150.0)];
            
            break;
            
        case 4:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 35;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(75.0, 150.0) withDimensionX:1.5 andY:0.5 withAngle:0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:3 andMaxTimePlay:self.level.maxTime];
            [self addKinematicBoxWithCoords:CGPointMake(175.0, 150.0) withDimensionX:1.5 andY:0.5 withAngle:-0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:5 andMaxTimePlay:self.level.maxTime];
            [self addKinematicBoxWithCoords:CGPointMake(275.0, 150.0) withDimensionX:1.5 andY:0.5 withAngle:0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:3 andMaxTimePlay:self.level.maxTime];
            [self addKinematicBoxWithCoords:CGPointMake(375.0, 150.0) withDimensionX:1.5 andY:0.5 withAngle:-0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:5 andMaxTimePlay:self.level.maxTime];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(75.0, 250.0)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(460.0, 140.0)];
            
            break;
            
        case 5:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 40;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(55.0, 80.0) withDimensionX:0.5 andY:0.5 withAngle:0.6 andCenter:b2Vec2(0.0, 0.0) andMechanicType:6 andMaxTimePlay:10];
            [self addKinematicBoxWithCoords:CGPointMake(100.0, 70.0) withDimensionX:0.5 andY:0.5 withAngle:0.6 andCenter:b2Vec2(0.0, 0.0) andMechanicType:6 andMaxTimePlay:0];
            [self addKinematicBoxWithCoords:CGPointMake(450.0, 70.0) withDimensionX:0.3 andY:1.5 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:2 andMaxTimePlay:self.level.maxTime];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(85.0, 250.0)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(300.0, 40.0)];
            
            break;
            
        default:
            //Adding hero
            [self addHeroWithCoords:CGPointMake(100.0, 200.0)];
            break;
    }
    
}

//Add a kinetic box to the physical world
-(void)addKinematicBoxWithCoords:(CGPoint)p 
                  withDimensionX:(CGFloat)x 
                            andY:(CGFloat)y 
                       withAngle:(CGFloat)a 
                       andCenter:(b2Vec2)center
                 andMechanicType:(int) mT 
                  andMaxTimePlay:(int)maxPlay
{
	//Define the kinetic body
    //Set up a 1m squared box in the physics world
	b2BodyDef bodyDef;
    bodyDef.type = b2_kinematicBody; //Kinetic static body
    //bodyDef.angle = a; //Define angle
    
	bodyDef.position.Set(p.x/32, p.y/32);
	
    MoveableObject *moveableObject = [[MoveableObject alloc] init];
    moveableObject.mechanicType = mT;
    moveableObject.maxTimePlay = maxPlay;
    bodyDef.userData = moveableObject;
	
    b2Body *body = self.level->world->CreateBody(&bodyDef);
	
	// Define another box shape for our dynamic body.
	b2PolygonShape kinematicBox;
	kinematicBox.SetAsBox(x, y, center, a);
	
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &kinematicBox;	
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.2f;
	body->CreateFixture(&fixtureDef);
}

//Add a hero to the physical world
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
    fixtureDef.restitution = 0.3f;
	self.level.hero->CreateFixture(&fixtureDef);
    //body->CreateFixture(&fixtureDef);
}

//Add a goal to the physical world
-(void)addGoalWithCoords:(CGPoint)p
{
	self.level.goal = p;
    CCSprite* sprite = [self.level.graphicLayer createSpriteFromPicture:(GOAL)];
    sprite.position = ccp(p.x, p.y);
}

@end
