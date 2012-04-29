//
//  BackgroundLayer.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 21/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// The red background layer

#import "BackgroundLayer.h"
#import "Game.h"

@implementation BackgroundLayer
-(id)init {
    self = [super init];
    if (self != nil) {
        CCSprite *backgroundImage;
        backgroundImage = [CCSprite spriteWithFile:@"Background.png"];
        [backgroundImage setPosition: CGPointMake([Game unit]*7.5,[Game unit]*5)];
        [self addChild:backgroundImage z:0 tag:0];
    }
    return self;
}
@end
