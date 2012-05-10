//
//  LevelBuilder.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// Defines how levels looks

#import "LevelBuilder.h"
#import "Game.h"
#import "MoveableObject.h"
#import "Box2D.h"
#import "Graphicmanager.h"
#import "Hero.h"

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
            
            //Moveable object
            [self addKinematicBoxWithCoords:CGPointMake(4.6, 4.6) withDimensionX:2.5 andY:0.4 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(-1.0, 0.0) andRewindVelocity:b2Vec2(1.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(3.1, 9.4)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(300.00, 30.0)];
            
            //Writing an introduction
            CCLabelTTF* intro = [[GraphicManager sharedManager] createText:@"Welcome to Aloha Physics!"];
            intro.position = ccp(240,280);
            
            //Writing an instruction
            CCLabelTTF* instruction = [[GraphicManager sharedManager] createText:@"Press the screen to start!"];
            instruction.position = ccp(240,230);
            
        } //(These are nessary when defining new objects in switch statement)
            break;
        
        case 2:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 25;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(3.1, 2.8) withDimensionX:2.0 andY:0.4 withAngle:-0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, 10.0) andRewindVelocity:b2Vec2(0.0, -10.0) andMaxTimePlay:self.level.maxTime withSprite:@"block256x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(3.1, 7.8)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(320.0, 200.0)];
            
            break;
            
        case 3:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 25;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(7.8, 1.0) withDimensionX:2.0 andY:0.4 withAngle:0.0 andCenter:b2Vec2(5.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(2.0, 0.0) andRewindVelocity:b2Vec2(-2.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block256x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(11.9, 6.25)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(150.0, 200.00)];
            
            break;
            
        case 4:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 10;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(6.9, 2.2) withDimensionX:1.5 andY:1.0 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, -8.7) andRewindVelocity:b2Vec2(0.0, 8.7) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(6.9, 3.1)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(220.0, 260.0)];
            
            break;
            
        case 5:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 40;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(1.7, 2.5) withDimensionX:0.4 andY:0.4 withAngle:0.6 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(13.0, 11.0) andRewindVelocity:b2Vec2(-13.0, -11.0) andMaxTimePlay:10 withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(3.1, 2.2) withDimensionX:0.4 andY:0.4 withAngle:0.6 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(13.0, 11.0) andRewindVelocity:b2Vec2(-13.0, -11.0) andMaxTimePlay:0 withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(14.1, 2.2) withDimensionX:0.4 andY:1.5 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, 10.0) andRewindVelocity:b2Vec2(0.0, -10.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(2.65, 3.1)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(370.0, 40.0)];
            
            break;
            
        case 6:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 35;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(2.34, 4.7) withDimensionX:1.5 andY:0.5 withAngle:0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(-2.0, 0.0) andRewindVelocity:b2Vec2(2.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(5.5, 4.7) withDimensionX:1.5 andY:0.5 withAngle:-0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(2.0, 0.0) andRewindVelocity:b2Vec2(-2.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(8.6, 4.7) withDimensionX:1.5 andY:0.5 withAngle:0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(-2.0, 0.0) andRewindVelocity:b2Vec2(2.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(11.7, 4.7) withDimensionX:1.5 andY:0.5 withAngle:-0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(2.0, 0.0) andRewindVelocity:b2Vec2(-2.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(2.34, 7.8)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(460.0, 140.0)];
            
            break;
        
        case 7:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 20;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(2.65, 4.7) withDimensionX:3.0 andY:0.5 withAngle:0.0 andCenter:b2Vec2(2.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(-2.0, 10.0) andRewindVelocity:b2Vec2(2.0, 10.0) andMaxTimePlay:self.level.maxTime withSprite:@"block384x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(3.1, 6.25)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(460.0, 150.0)];
            
            break;
            
        case 8:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 10;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(1.25, 6.25) withDimensionX:1.0 andY:0.4 withAngle:-0.6 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, -5.0) andRewindVelocity:b2Vec2(0.0, 5.0) andMaxTimePlay:0 withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(3.75, 5.3) withDimensionX:1.0 andY:0.4 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, -5.0) andRewindVelocity:b2Vec2(0.0, 5.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(6.9, 5.3) withDimensionX:1.0 andY:0.4 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, -5.0) andRewindVelocity:b2Vec2(0.0, 5.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(10.5, 5.3) withDimensionX:1.0 andY:0.4 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, -5.0) andRewindVelocity:b2Vec2(0.0, 5.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];

            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(1.25, 7.8)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(460.0, 170.0)];
            
            break;
            
        case 9:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 30;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(1.25, 6.25) withDimensionX:1.0 andY:0.4 withAngle:-0.6 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, -5.0) andRewindVelocity:b2Vec2(0.0, 5.0) andMaxTimePlay:0 withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(3.75, 3.1) withDimensionX:1.0 andY:0.4 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, 5.0) andRewindVelocity:b2Vec2(0.0, -5.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(6.9, 7.5) withDimensionX:1.0 andY:0.4 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, -5.0) andRewindVelocity:b2Vec2(0.0, 5.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(10.94, 3.1) withDimensionX:1.0 andY:0.4 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, 5.0) andRewindVelocity:b2Vec2(0.0, -5.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(1.25, 7.5)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(460.0, 190.0)];
            
            break;
            
        case 10:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 20;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(6.9, 2.8) withDimensionX:4.0 andY:0.4 withAngle:0.6 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(-3.5, 0.0) andRewindVelocity:b2Vec2(3.5, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(6.9, 3.75)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(220.0, 260.0)];
            
            break;
            
        case 11:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 15;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(1.7, 1.0) withDimensionX:1.2 andY:0.4 withAngle:-0.6 andCenter:b2Vec2(1.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(5.0, 0.0) andRewindVelocity:b2Vec2(-5.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(12.34, 2.8) withDimensionX:1.2 andY:0.4 withAngle:0.6 andCenter:b2Vec2(-1.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(-5.0, 0.0) andRewindVelocity:b2Vec2(5.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(1.7, 4.7) withDimensionX:1.2 andY:0.4 withAngle:-0.6 andCenter:b2Vec2(1.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(5.0, 0.0) andRewindVelocity:b2Vec2(-5.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(12.34, 6.6) withDimensionX:1.2 andY:0.4 withAngle:0.6 andCenter:b2Vec2(-1.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(-5.0, 0.0) andRewindVelocity:b2Vec2(5.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(2.0, 2.3)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(200.00, 300.0)];
            
            break;
            
        case 12:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 15;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(13.0, 7.0) withDimensionX:1.2 andY:0.4 withAngle:0.5 andCenter:b2Vec2(-1.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(-4.0, 0.0) andRewindVelocity:b2Vec2(4.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(2.0, 3.5) withDimensionX:1.2 andY:0.4 withAngle:-0.7 andCenter:b2Vec2(1.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(4.0, 0.0) andRewindVelocity:b2Vec2(-4.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block192x64.png"];
            //Obstacles
            [self addKinematicBoxWithCoords:CGPointMake(7.5, 6.7) withDimensionX:0.4 andY:1.2 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(4.0, 0.0) andRewindVelocity:b2Vec2(-4.0, 0.0) andMaxTimePlay:0 withSprite:@"block192x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(7.5, 2.0) withDimensionX:0.4 andY:1.5 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(4.0, 0.0) andRewindVelocity:b2Vec2(-4.0, 0.0) andMaxTimePlay:0 withSprite:@"block192x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(12.5, 9.5)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(360.00, 60.0)];
            
            break;
            
        case 13:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 15;
            
            //Moveable objects
            [self addKinematicBoxWithCoords:CGPointMake(1.5, 1.3) withDimensionX:1.6 andY:0.4 withAngle:-0.6 andCenter:b2Vec2(1.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(5.0, 0.0) andRewindVelocity:b2Vec2(-5.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(13.0, 3.0) withDimensionX:1.2 andY:0.4 withAngle:0.7 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, 9.0) andRewindVelocity:b2Vec2(0.0, -9.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(2.0, 2.8)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(100.00, 270.0)];
            
            break;
            
        case 14:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 15;
            
            [self addKinematicBoxWithCoords:CGPointMake(2.0, 3.5) withDimensionX:1.7 andY:0.4 withAngle:-0.7 andCenter:b2Vec2(1.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(4.0, 0.0) andRewindVelocity:b2Vec2(-4.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            
            [self addKinematicBoxWithCoords:CGPointMake(11.0, 8.0) withDimensionX:0.4 andY:1.5 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(4.0, 0.0) andRewindVelocity:b2Vec2(-4.0, 0.0) andMaxTimePlay:0 withSprite:@"block320x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(11.0, 3.0) withDimensionX:0.4 andY:1.5 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(4.0, 0.0) andRewindVelocity:b2Vec2(-4.0, 0.0) andMaxTimePlay:0 withSprite:@"block320x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(2.5, 7.8)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(430.00, 150.0)];
            
            break;
            
        /*case 15:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 15;
            
            //Moveable object
            [self addKinematicBoxWithCoords:CGPointMake(13.7, 5.0) withDimensionX:0.7 andY:0.4 withAngle:0.6 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(-6.75, 8.75) andRewindVelocity:b2Vec2(6.75, -8.75) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(12.7, 4.7) withDimensionX:1.2 andY:0.4 withAngle:-0.9 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(0.0, 0.0) andRewindVelocity:b2Vec2(0.0, 0.0) andMaxTimePlay:0 withSprite:@"block320x64.png"];
            
            [self addKinematicBoxWithCoords:CGPointMake(0.8, 3.7) withDimensionX:0.7 andY:0.4 withAngle:-1.2 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(10.0, 3.0) andRewindVelocity:b2Vec2(-10.0, -3.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(1.8, 3.0) withDimensionX:1.4 andY:0.4 withAngle:0.3 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(0.0, 0.0) andRewindVelocity:b2Vec2(0.0, 0.0) andMaxTimePlay:0 withSprite:@"block320x64.png"];
            
            [self addKinematicBoxWithCoords:CGPointMake(12.0, 2.5) withDimensionX:0.9 andY:0.4 withAngle:0.6 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(-7.25, 9.0) andRewindVelocity:b2Vec2(7.25, -9.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(10.7, 2.2) withDimensionX:1.2 andY:0.4 withAngle:-0.9 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(-4.0, 0.0) andRewindVelocity:b2Vec2(4.0, 0.0) andMaxTimePlay:0 withSprite:@"block320x64.png"];
            
            //Obstacles
            [self addKinematicBoxWithCoords:CGPointMake(7.5, 6.7) withDimensionX:0.4 andY:1.2 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(4.0, 0.0) andRewindVelocity:b2Vec2(-4.0, 0.0) andMaxTimePlay:0 withSprite:@"block320x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(7.5, 2.0) withDimensionX:0.4 andY:1.5 withAngle:0.0 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(4.0, 0.0) andRewindVelocity:b2Vec2(-4.0, 0.0) andMaxTimePlay:0 withSprite:@"block320x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(13.0, 8.0)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(280.00, 210.0)];
            
            break;
            
        case 15:
            //Setting max frames for a moveable object to move
            self.level.maxTime = 15;
            
            [self addKinematicBoxWithCoords:CGPointMake(0.8, 1.7) withDimensionX:0.7 andY:0.4 withAngle:-1.2 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(15.0, 4.5) andRewindVelocity:b2Vec2(-15.0, -4.5) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            [self addKinematicBoxWithCoords:CGPointMake(1.8, 1.0) withDimensionX:1.4 andY:0.4 withAngle:0.3 andCenter:b2Vec2(0.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(0.0, 0.0) andRewindVelocity:b2Vec2(0.0, 0.0) andMaxTimePlay:0 withSprite:@"block320x64.png"];
            
            [self addKinematicBoxWithCoords:CGPointMake(13.0, 1.0) withDimensionX:1.2 andY:0.4 withAngle:0.7 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, 13.0) andRewindVelocity:b2Vec2(0.0, -13.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            
            [self addKinematicBoxWithCoords:CGPointMake(9.0, 5.0) withDimensionX:1.2 andY:0.4 withAngle:-0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(0.0, 6.0) andRewindVelocity:b2Vec2(0.0, -6.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            
            [self addKinematicBoxWithCoords:CGPointMake(15.0, 5.5) withDimensionX:1.0 andY:0.4 withAngle:0.8 andCenter:b2Vec2(-1.0, -0.3) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(-6.0, 0.0) andRewindVelocity:b2Vec2(6.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            
            [self addKinematicBoxWithCoords:CGPointMake(1.0, 4.0) withDimensionX:1.0 andY:0.4 withAngle:-0.8 andCenter:b2Vec2(1.0, 0.0) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(5.0, 0.0) andRewindVelocity:b2Vec2(-5.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            
            [self addKinematicBoxWithCoords:CGPointMake(7.0, 4.5) withDimensionX:1.0 andY:0.4 withAngle:0.8 andCenter:b2Vec2(-1.0, -0.3) andMechanicType:ANGULAR andPlayVelocity:b2Vec2(-5.0, 0.0) andRewindVelocity:b2Vec2(5.0, 0.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(2.0, 2.8)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(100.00, 270.0)];
            
            break;
            
        case 16:
        {//Setting max frames for a moveable object to move
            self.level.maxTime = 10;
            
            //Define polygon
            b2Vec2 verts[] = {b2Vec2(0.3, 0.3), b2Vec2(-0.6, -0.3), b2Vec2(0.6, -0.3)};
            
            //Moveable objects
            [self addKinematicPolygonWithCoords:CGPointMake(1.7, 2.1) withVertexes:verts andNumberOfVertexes:3 withAngle:0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(5.0, 5.0) andRewindVelocity:b2Vec2(-5.0, -5.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            [self addKinematicPolygonWithCoords:CGPointMake(3.5, 3.0) withVertexes:verts andNumberOfVertexes:3 withAngle:0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(5.0, 5.0) andRewindVelocity:b2Vec2(-5.0, -5.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            [self addKinematicPolygonWithCoords:CGPointMake(5.5, 4.0) withVertexes:verts andNumberOfVertexes:3 withAngle:0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(5.0, 5.0) andRewindVelocity:b2Vec2(-5.0, -5.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            [self addKinematicPolygonWithCoords:CGPointMake(7.5, 5.0) withVertexes:verts andNumberOfVertexes:3 withAngle:0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(5.0, 5.0) andRewindVelocity:b2Vec2(-5.0, -5.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            [self addKinematicPolygonWithCoords:CGPointMake(9.5, 6.0) withVertexes:verts andNumberOfVertexes:3 withAngle:0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(5.0, 5.0) andRewindVelocity:b2Vec2(-5.0, -5.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            [self addKinematicPolygonWithCoords:CGPointMake(11.5, 7.0) withVertexes:verts andNumberOfVertexes:3 withAngle:0.5 andCenter:b2Vec2(0.0, 0.0) andMechanicType:LINEAR andPlayVelocity:b2Vec2(5.0, 5.0) andRewindVelocity:b2Vec2(-5.0, -5.0) andMaxTimePlay:self.level.maxTime withSprite:@"block320x64.png"];
            
            //Adding hero
            [self addHeroWithCoords:CGPointMake(2.25, 3.5)];
            
            //Adding goal
            [self addGoalWithCoords:CGPointMake(430.0, 190.0)];
        }
            break;*/
            
        default:
            //Adding hero
            [self addHeroWithCoords:CGPointMake(3.1, 6.25)];
            break;
    }
    
}

//Add a kinetic box to the physical world
-(void)addKinematicBoxWithCoords:(CGPoint)p 
                  withDimensionX:(CGFloat)x 
                            andY:(CGFloat)y 
                       withAngle:(CGFloat)a 
                       andCenter:(b2Vec2)center
                 andMechanicType:(MechanicType) mT 
                 andPlayVelocity:(b2Vec2)play 
               andRewindVelocity:(b2Vec2)rewind 
                  andMaxTimePlay:(int)maxPlay 
                      withSprite:(NSString*) picture
{
	//Define the kinetic body
    //Set up a 1m squared box in the physics world
	b2BodyDef bodyDef;
    bodyDef.type = b2_kinematicBody; //Kinetic static body
    
	bodyDef.position.Set(p.x, p.y);
    
    //Assign mechanic to moveable object
    MoveableObject *moveableObject = [[MoveableObject alloc] init];
    Mechanic *mechanicObject = [[Mechanic alloc] initWithPlayVelocity:play andRewindVelocity:rewind andType:mT];
    moveableObject.mechanic = mechanicObject;
    moveableObject.angle = a;
    moveableObject.center = center;
    
    moveableObject.maxTimePlay = maxPlay;
    moveableObject.sprite = [[GraphicManager sharedManager] createSpriteFromPicture:picture];
	
    //Create body
    b2Body *body = self.level->world->CreateBody(&bodyDef);
    
    moveableObject.physicalBody = body;
	
    //Add physical object to levels array
    [self.level.physicalObjects addObject:moveableObject];
    
	// Define another box shape for our kinematic body.
	b2PolygonShape kinematicBox;
	kinematicBox.SetAsBox(x, y, center, a);
	
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &kinematicBox;	
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.2f;
	body->CreateFixture(&fixtureDef);
}


//Add a kinetic polygon to the physical world
-(void)addKinematicPolygonWithCoords:(CGPoint)p 
                    withVertexes:(b2Vec2*)vertexes 
             andNumberOfVertexes:(int)count 
                       withAngle:(CGFloat)a 
                       andCenter:(b2Vec2)center
                     andMechanicType:(MechanicType) mT 
                     andPlayVelocity:(b2Vec2)play 
                   andRewindVelocity:(b2Vec2)rewind
                  andMaxTimePlay:(int)maxPlay 
                          withSprite:(NSString*) picture
{
	//Define the kinetic body
    //Set up a 1m squared box in the physics world
	b2BodyDef bodyDef;
    bodyDef.type = b2_kinematicBody; //Kinetic static body
    bodyDef.angle = a; //Define angle
    
	bodyDef.position.Set(p.x, p.y);
	
    //Assign mechanic to moveable object
    MoveableObject *moveableObject = [[MoveableObject alloc] init];
    Mechanic *mechanicObject = [[Mechanic alloc] initWithPlayVelocity:play andRewindVelocity:rewind andType:mT];
    moveableObject.mechanic = mechanicObject;
    moveableObject.angle = a;
    moveableObject.center = center;
    
    moveableObject.maxTimePlay = maxPlay;
    moveableObject.sprite = [[GraphicManager sharedManager] createSpriteFromPicture:picture];
	
    //Create physical body
    b2Body *body = self.level->world->CreateBody(&bodyDef);
	
    moveableObject.physicalBody = body;
	
    //Add physical object to levels array
    [self.level.physicalObjects addObject:moveableObject];
    
	// Define another polygon shape for our kinematic body
    b2PolygonShape polygonShape;
    polygonShape.Set(vertexes, count);
    
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &polygonShape;	
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.2f;
	body->CreateFixture(&fixtureDef);
}


//Add a hero to the physical world
-(void)addHeroWithCoords:(CGPoint)p
{
    //Define the dynamic body
	//Set up a circle in the physics world
	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
    
	bodyDef.position.Set(p.x, p.y);
    
    // Construct a hero
    Hero* hero = [[Hero alloc] init];
    hero.x = p.x;
    hero.y = p.y;
    
    hero.physicalBody = self.level->world->CreateBody(&bodyDef);
	
	// Define another circle shape for our dynamic body.
    b2CircleShape dynamicCircle;
	dynamicCircle.m_radius = 0.5; //Sets the radius of the circle
	
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicCircle;
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 0.4f;
    fixtureDef.restitution = 0.15f;
    hero.physicalBody->CreateFixture(&fixtureDef);
    
	self.level.hero = hero;
}

//Add a goal to the physical world
-(void)addGoalWithCoords:(CGPoint)p
{
    Goal* goal = [[Goal alloc] init];
    goal.x = p.x;
    goal.y = p.y;
	self.level.goal = goal;
}

@end
