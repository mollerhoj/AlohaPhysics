//
//  GraphicManager.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 21/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "GraphicManager.h"
#import "Game.h"

@interface GraphicManager()

//The sprite batch for all the sprites to be created in
@property (nonatomic,assign) CCSpriteBatchNode *batch;
@property (nonatomic,assign) NSMutableSet *labels;
@end

@implementation GraphicManager

#define graphicsTag 1

//The shared Layer
static GraphicManager *sharedManager;

//Batch holding all sprites
@synthesize batch = _batch;

//Array holding all labels
@synthesize labels = _labels;

+(GraphicManager*) sharedManager
{
	@synchronized(self)     {
		if (!sharedManager)
			sharedManager = [[GraphicManager alloc] init];
	}
	return sharedManager;
}

//Init loads images from the big file.
-(id)init {
    self = [super init];
    if (self != nil) {
        //Init sprite batch
        self.batch = [CCSpriteBatchNode batchNodeWithFile:@"sprites.png" capacity:150];
		[self addChild:self.batch z:0 tag:graphicsTag];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sprites.plist"];       
        
        //Init array to hold all labels
        self.labels = [[NSMutableSet alloc] init];
    }
    return self;
}

//Create a new sprite on this layer with the given Picture, and return it
-(CCSprite*)createSpriteFromPicture:(Picture)picture {
    NSString *image;
    
    //Defining where each picture is placed on the spritesheet
    switch (picture) {
        case HERO:
            image = @"Sprite_Hero.png";
            break;
        case GOAL:
            image = @"Sprite_Goal.png";
            break;
        case BLOCK320x64:
            image = @"block320x64.png";
            break;
        default:
            NSLog(@"Sprite could not be loaded");
            break;
    }
    
    //Cut out the sprite
    CCSprite *sprite = [CCSprite spriteWithSpriteFrameName:image];
    
    //Put sprite in the layer
    [self.batch addChild:sprite];
    
    //return sprite
    return sprite;
}

//Create a label in the on this layer and return it
-(CCLabelTTF*)createText:(NSString*)text {
    CCLabelTTF *label = [CCLabelTTF labelWithString:text fontName:@"Quicksand" fontSize:24];
    [self addChild:label z:0];
    [label setColor:ccc3(0,0,0)];
    [self.labels addObject:label];
    return label;
}

//Remove all graphics from this layer
-(void)removeGraphics {
    
    //Remove all labels from graphicsLayer
    for (CCLabelTTF* label in self.labels) {
        [self removeChild:label cleanup:true];
    }
    //Remove all labels from array;
    [self.labels removeAllObjects];
    
    //Remove all sprites
    [self.batch removeAllChildrenWithCleanup:true];
}

 
@end
 

