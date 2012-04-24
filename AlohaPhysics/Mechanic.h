//
//  Mechanic.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box2D.h"

@interface Mechanic : NSObject 

enum {
    LINEAR,
    ANGULAR,
}
typedef MechanicType;

@property (nonatomic,assign) MechanicType type;

-(id)initWithPlayVelocity:(b2Vec2)play andRewindVelocity:(b2Vec2)rewind andType:(MechanicType) type;
-(void)playMechanicWithBody:(b2Body *)body;
-(void)rewindMechanicWithBody:(b2Body *)body;
-(void)stopMovementForBody:(b2Body *)body;

@end
