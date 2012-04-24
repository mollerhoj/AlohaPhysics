//
//  Mechanic.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Mechanic.h"
#import "Box2D.h"

@interface Mechanic()

@property (nonatomic,assign) b2Vec2 playVelocity;
@property (nonatomic,assign) b2Vec2 rewindVelocity;

@end

@implementation Mechanic

@synthesize playVelocity = _playVelocity;
@synthesize rewindVelocity = _rewindVelocity;
@synthesize type = _type;

-(id)initWithPlayVelocity:(b2Vec2)play andRewindVelocity:(b2Vec2)rewind andType:(MechanicType) type
{
    if( (self=[super init])) {
		self.playVelocity = play;
        self.rewindVelocity = rewind;
        self.type = type;
    }
    return self;
}

//Play kinematic body
-(void)playMechanicWithBody:(b2Body *)body
{
    if(body->GetType() == b2_kinematicBody) 
    {
        if(self.type == LINEAR)
        {
            body->SetLinearVelocity(self.playVelocity);
        } else {
            body->SetAngularVelocity(self.playVelocity.x); //Not cool! TODO
        }
    }
}

//Rewind kinematic body
-(void)rewindMechanicWithBody:(b2Body *)body
{
    if(body->GetType() == b2_kinematicBody) 
    {
        if(self.type == LINEAR)
        {
            body->SetLinearVelocity(self.rewindVelocity);
        } else {
            body->SetAngularVelocity(self.rewindVelocity.x); //Not cool! TODO
        }
    }
}

//Stop movement
-(void)stopMovementForBody:(b2Body *)body
{
    if(body->GetType() == b2_kinematicBody) 
    {
        body->SetLinearVelocity(b2Vec2(0.0, 0.0));
        body->SetAngularVelocity(0.0);
    }
}

@end
