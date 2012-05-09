//
//  LevelBuilder.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"
#import "Mechanic.h"

@interface LevelBuilder : NSObject

@property (nonatomic, assign) Level *level;

- (void)buildLevel:(int)levelNumber;
-(id)initWithLevel:(Level *)level;
-(void)addKinematicBoxWithCoords:(CGPoint)p 
                  withDimensionX:(CGFloat)x 
                            andY:(CGFloat)y 
                       withAngle:(CGFloat)a
                       andCenter:(b2Vec2)center
                 andMechanicType:(MechanicType) mT 
                 andPlayVelocity:(b2Vec2)play 
               andRewindVelocity:(b2Vec2)rewind 
                  andMaxTimePlay:(int)maxPlay 
                      withSprite:(NSString*) picture;

-(void)addKinematicPolygonWithCoords:(CGPoint)p 
                    withVertexes:(b2Vec2*)vertexes 
             andNumberOfVertexes:(int)count 
                       withAngle:(CGFloat)a 
                       andCenter:(b2Vec2)center 
                     andMechanicType:(MechanicType) mT 
                     andPlayVelocity:(b2Vec2)play 
                   andRewindVelocity:(b2Vec2)rewind 
                      andMaxTimePlay:(int)maxPlay 
                          withSprite:(NSString*) picture;

-(void)addHeroWithCoords:(CGPoint)p;
-(void)addGoalWithCoords:(CGPoint)p;

@end
