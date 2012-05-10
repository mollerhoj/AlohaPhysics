//
//  GameManager.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 28/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameManager : NSObject

typedef enum {
    StartScreenSceneEnum,
    GameSceneEnum,
    EndSceneEnum,
    LevelSelectSceneEnum
} Scenes;

+(GameManager*) sharedManager;

-(void)startGame;

-(void)runScene:(Scenes)scene;

-(void)pushScene:(Scenes)scene;

-(void)popScene;

-(void)replaceScene:(Scenes)scene;

@end
