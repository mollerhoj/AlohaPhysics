//
//  GraphicLayer.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 21/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GraphicLayer.h"
#import "Game.h"

@interface GraphicLayer()

//The sprite batch for all the sprites to be created in
@property CCSpriteBatchNode *batch;

@end

@implementation GraphicLayer

#define graphicsTag 1

@synthesize batch = _batch;

-(id)init {
    self = [super init];
    if (self != nil) {
        //Init sprite batch
        self.batch = [CCSpriteBatchNode batchNodeWithFile:@"graphics.png" capacity:150];
		[self addChild:self.batch z:0 tag:graphicsTag];
        
        //Test creating a picture
        CCSprite *sprite = [self createSpriteFromPicture:GOAL];
        sprite.position = ccp(16, 16);
    }
    return self;
}

-(CCSprite*)createSpriteFromPicture:(Picture)picture {
    CGRect rect;
    
    switch (picture) {
        case HERO:
            rect = CGRectMake(0,0,32,32);
            break;
        case GOAL:
            rect = CGRectMake(32,0,32,32);
            break;
            
        default:
            break;
    }
    
    CCSprite *sprite = [CCSprite spriteWithBatchNode:self.batch rect:rect];
    [self.batch addChild:sprite];
    
    return sprite;
}

-(void)removeSprite:(CCSprite*)sprite {
    [self.batch removeChild:sprite cleanup:true];
}

@end
