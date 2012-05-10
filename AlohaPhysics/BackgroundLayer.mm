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
#import "Utils.h"

@implementation BackgroundLayer

#define DEFAULT_BACKGROUND_IMAGE @"Background.png"

@synthesize image = _image;

-(id)init {
    return [self initWithImage:DEFAULT_BACKGROUND_IMAGE];
}

-(id)initWithImage:(NSString *)image {
    self = [super init];
    if (self != nil) {
        if ([Utils fileExistsInProject:image]) {
            self.image = image;
        }
    }
    return self;
}

-(void)setImage:(NSString *)image {
    CCSprite *backgroundImage;
    backgroundImage = [CCSprite spriteWithFile:image];
    [backgroundImage setPosition: CGPointMake([Game unit]*7.5,[Game unit]*5)];
    [self addChild:backgroundImage z:0 tag:0];
}

@end
