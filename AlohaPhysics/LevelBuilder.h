//
//  LevelBuilder.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"

@interface LevelBuilder : NSObject

@property (nonatomic, assign) Level *level;

- (void) buildLevel:(int)levelNumber;

@end
