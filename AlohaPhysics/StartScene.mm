//
//  StartScene.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 09/05/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "StartScene.h"
#import "BackgroundLayer.h"
#import "GameManager.h"

@implementation StartScene

-(id)init {
    self = [super init];
    if (self != nil) {
        
        //Background Layer
        BackgroundLayer *backgroundLayer = [BackgroundLayer node];
        backgroundLayer.image = @"Background.png";
        [self addChild:backgroundLayer z:0];
        
        //MenuLayer
        CCLayer* menuLayer = [CCLayer node];
        [self addChild:menuLayer z:5];
        
        //Add a menu to the menuLayer
        CCMenuItem *playButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"Sprite_levelButton1.png"]
                                                            selectedSprite:[CCSprite spriteWithSpriteFrameName:@"Sprite_levelButton2.png"]
                                                                    target:self
                                                                  selector:@selector(playButtonAction)];
        
        playButton.position=ccp(50,50);
        CCMenu *menu=[CCMenu menuWithItems:playButton,nil];
        menu.position=ccp(0,0);
        [menuLayer addChild:menu];
        
    }
    return self;
}

-(void)playButtonAction {
    [[GameManager sharedManager] replaceScene:GameSceneEnum];
}

@end
