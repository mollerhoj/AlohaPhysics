//
//  GraphicManager.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 21/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// Managing sprites and labels on the current main layer. (The main layer is defined as the layer that all objects draw to)

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
@synthesize font = _font;

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
        //Set the batch to the batch of sprites.
        self.batch = [CCSpriteBatchNode batchNodeWithFile:@"sprites.png" capacity:150];
        //Put all sprites in shared Cache
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sprites.plist"];       
        
        //Init array to hold all labels
        self.labels = [[NSMutableSet alloc] init];
    }
    return self;
}

//Setting a layer automatically makes sprites from the sprite.png ready.
//This is not very scalable, but makes the code easier for small games.
-(void)setLayer:(CCLayer *)layer {
    
    //Set the layer
    _layer = layer;
    
    //Remove all sprites from cache
    [[CCSpriteFrameCache sharedSpriteFrameCache] removeSpriteFrames];
    
    //Set the batch to the batch of sprites. Must be a new batch, which is why sprites are reloaded everytime sceens are switched
    self.batch = [CCSpriteBatchNode batchNodeWithFile:@"sprites.png" capacity:150];
    
    //Put all sprites in shared Cache
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sprites.plist"];    
    
    //Add the batch to the new layer
    [self.layer addChild:self.batch z:0 tag:graphicsTag];
}

//Create a new sprite on this layer with the given Picture, and return it
-(CCSprite*)createSpriteFromPicture:(NSString*)picture 
{
    NSString *image;
    
    image = picture;
    
    //Get the sprite from the frame
    CCSprite *sprite = [CCSprite spriteWithSpriteFrameName:fileName];
    
    //Put sprite in the layer
    [self.batch addChild:sprite];
    
    //return sprite
    return sprite;
}

//Create a label in the on this layer and return it
-(CCLabelTTF*)createText:(NSString*)text {
    CCLabelTTF *label = [CCLabelTTF labelWithString:text fontName:self.font fontSize:24];
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
 

