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

@end

@implementation Mechanic

@synthesize moveableObject = _moveableObject;

-(void)playMechanicType:(int) mechanicType withBody:(b2Body *)body
{
    if(body->GetType() == b2_kinematicBody) 
    {
        switch (mechanicType) {
            case 1:
                body->SetAngularVelocity(-1.0);                
                break;
        
            case 2:
                body->SetLinearVelocity(b2Vec2(5.0, 7.0));
                break;
        
            case 3:
                body->ApplyAngularImpulse(3.0);
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
                body->SetLinearVelocity(b2Vec2(-5.0, -7.0));
                break;
                
            case 3:
                body->ApplyAngularImpulse(3.0);
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
