//
//  LevelSelectScene.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 02/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelSelectScene.h"
#import "BackgroundLayer.h"
#import "LevelSelectLayer.h"


@implementation LevelSelectScene

@synthesize mainLayer = _mainLayer;

-(id)init {
    self = [super init];
    if (self != nil) {
        //Background Layer
        //BackgroundLayer *backgroundLayer = [BackgroundLayer node];
        //[self addChild:backgroundLayer z:0];
        
        //GraphicsLayer
        
        self.mainLayer = [LevelSelectLayer node];
        [self addChild:self.mainLayer];
        
        //THIS SHOUD BE PLACED ELSE WHERE: THINK ARCHICTURE
        //[[GraphicManager sharedManager]setLayer:self.mainLayer];
         
    }
    return self;
}

@end
