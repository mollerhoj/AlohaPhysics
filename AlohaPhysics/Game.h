//
//  Game.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 20/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"
#import "GameScene.h"

@interface Game : NSObject {

}

@property (nonatomic, assign) Level *level;

@property (nonatomic,assign) GameScene *scene;

- (id)initWithScene:(GameScene *)scene;

- (void)step;

+ (int)unit;

+ (void)setUnit:(int)pixel_per_unit;

@end
