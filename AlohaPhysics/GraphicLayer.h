//
//  GraphicLayer.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 21/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface GraphicLayer : CCLayer

enum  {
    HERO,
    GOAL,
    BLOCK320x64
}
typedef Picture;

//The shared GraphicsLayer
+(GraphicLayer*) sharedLayer;

//Create a sprite of one of the pictures defined in the picture array
-(CCSprite*)createSpriteFromPicture:(Picture)picture;

//Create a text label
-(CCLabelTTF*)createText:(NSString*)text;

-(void)removeGraphics;

@end
