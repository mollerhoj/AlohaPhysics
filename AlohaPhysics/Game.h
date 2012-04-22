//
//  Game.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"
#import "Mechanic.h"

@interface Game : NSObject

@property (nonatomic, assign) Level *level;
@property (nonatomic,assign) Mechanic *mechanic;

- (void)step;

@end
