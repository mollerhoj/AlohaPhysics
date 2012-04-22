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
                body->ApplyAngularImpulse(2.0);
                break;
        
            case 2:
                body->ApplyAngularImpulse(2.0);
                break;
        
            case 3:
                body->ApplyAngularImpulse(3.0);
                break;
            
            default:
                break;
        }
    }
}


@end
