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
@property (nonatomic,assign) CCSpriteBatchNode *batch; //Batch holding all sprites
@property (nonatomic,assign) NSMutableSet *labels; //Array holding all labels
@end

@implementation GraphicManager

@synthesize batch = _batch;
@synthesize labels = _labels;
@synthesize layer = _layer;

#define graphicsTag 1

//The shared Layer
static GraphicManager *sharedManager;

//Access singleton
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
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sprites.plist"];       
        
        //Init array to hold all labels
        self.labels = [[NSMutableSet alloc] init];
    }
    return self;
}

-(void)setLayer:(CCLayer *)layer {
    _layer = layer;
    [self.layer addChild:self.batch z:0 tag:graphicsTag];
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
    [self.layer addChild:label z:0];
    [label setColor:ccc3(0,0,0)];
    [self.labels addObject:label];
    return label;
}

//Remove all graphics from this layer
-(void)removeGraphics {
    //Remove all labels from graphicsLayer
    for (CCLabelTTF* label in self.labels) {
        [self.layer removeChild:label cleanup:true];
    }
    //Remove all labels from array;
    [self.labels removeAllObjects];
    
    //Remove all sprites
    [self.batch removeAllChildrenWithCleanup:true];
}

@end
 

