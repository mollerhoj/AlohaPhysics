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
    BLOCK1
}
typedef Picture;

-(CCSprite*)createSpriteFromPicture:(Picture)picture;

-(void)removeSprite:(CCSprite*)sprite;

@end
