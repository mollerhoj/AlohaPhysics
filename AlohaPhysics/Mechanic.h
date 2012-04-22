//
//  Mechanic.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoveableObject.h"
#import "Box2D.h"

@interface Mechanic : NSObject 

-(void)playMechanicType:(int) mechanicType withBody:(b2Body *)body;
-(void)rewindMechanicType:(int) mechanicType withBody:(b2Body *)body;
-(void)stopMovementForBody:(b2Body *)body;

@end
