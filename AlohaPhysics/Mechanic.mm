//
//  Mechanic.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Mechanic.h"
@interface Mechanic()

@property (nonatomic, assign) MoveableObject *moveableObject;
@property (nonatomic,assign) CGFloat playVelocity;
@property (nonatomic,assign) CGFloat rewindVelocity;

@end

@implementation Mechanic

@synthesize moveableObject = _moveableObject;
@synthesize playVelocity = _playVelocity;
@synthesize rewindVelocity = _rewindVelocity;

-(id)initWithPlayVelocity:(CGFloat)play andRewindVelocity:(CGFloat)rewind 
{
    if( (self=[super init])) {
		self.playVelocity = play;
        self.rewindVelocity = rewind;
    }
    return self;
}

-(void)playMechanicType:(int) mechanicType withBody:(b2Body *)body
{
    if(body->GetType() == b2_kinematicBody) 
    {
        switch (mechanicType) {
            case 1:
                body->SetAngularVelocity(-1.0);
                break;
        
            case 2:
                body->SetLinearVelocity(b2Vec2(0.0, 10.0));
                break;
        
            case 3:
                body->SetAngularVelocity(-2.0);
                break;
            
            case 4:
                body->SetLinearVelocity(b2Vec2(0.0, -8.7));
                break;
                
            case 5:
                body->SetAngularVelocity(2.0);
                break;
                
            case 6:
                body->SetLinearVelocity(b2Vec2(13.0, 11.0));   
                break;
                
            case 7:
                body->SetAngularVelocity(-3.5);
                break;
                
            case 8:
                body->SetLinearVelocity(b2Vec2(0.0, -5.0));
                break;
                
            case 9:
                body->SetAngularVelocity(5.0);
                break;
                
            case 10:
                body->SetAngularVelocity(-5.0);
                break;
                
            case 11:
                body->SetLinearVelocity(b2Vec2(0.0, 5.0));
                break;
                
            case 12:
                body->SetLinearVelocity(b2Vec2(5.0, 5.0));
                break;
                
            default:
                break;
        }
    }
}

-(void)rewindMechanicType:(int) mechanicType withBody:(b2Body *)body
{
    if(body->GetType() == b2_kinematicBody) 
    {
        switch (mechanicType) {
            
            case 1:
                body->SetAngularVelocity(1.0);                
                break;
                
            case 2:
                body->SetLinearVelocity(b2Vec2(0.0, -10.0));
                break;
                
            case 3:
                body->SetAngularVelocity(2.0);
                break;
                
            case 4:
                body->SetLinearVelocity(b2Vec2(0.0, 8.7));
                break;
                
            case 5:
                body->SetAngularVelocity(-2.0);
                break;
                
            case 6:
                body->SetLinearVelocity(b2Vec2(-13.0, -11.0));    
                break;
                
            case 7:
                body->SetAngularVelocity(3.5);
                break;
                
            case 8:
                body->SetLinearVelocity(b2Vec2(0.0, 5.0));
                break;
                
            case 9:
                body->SetAngularVelocity(-5.0);
                break;
                
            case 10:
                body->SetAngularVelocity(5.0);
                break;
                
            case 11:
                body->SetLinearVelocity(b2Vec2(0.0, -5.0));
                break;
                
            case 12:
                body->SetLinearVelocity(b2Vec2(-5.0, -5.0));
                break;
                
            default:
                break;
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
