//
//  LevelSelectLayer.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 02/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelSelectLayer.h"
#import "GameManager.h"
#import "GameScene.h"

@implementation LevelSelectLayer

-(id) init
{
	if( (self=[super init])) {
        
        
        
        CCMenuItem *item1 = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"Sprite_levelButton1.png"]
                                                  selectedSprite:[CCSprite spriteWithSpriteFrameName:@"Sprite_levelButton2.png"]
                                                          target:self
                                                        selector:@selector(levelButtonAction:)];
        item1.tag = 1;
        
        //[CCMenuItemImage itemFromNormalImage:@"Sprite_levelButton1.png" selectedImage:@"Sprite_levelButton1.png" target:self selector:@selector(button1)];
        item1.position=ccp(50,50);
        /*
        CCMenuItem *item2=[CCMenuItemImage itemFromNormalImage:@"Sprite_levelButton2.png" selectedImage:@"Sprite_levelButton2.png" target:self selector:@selector(button2)];
        item2.position=ccp(250,40);
        */
        
        CCMenu *menu=[CCMenu menuWithItems:item1,nil];
        menu.position=ccp(0,0);
        [self addChild:menu];
	}
	return self;
}

-(void)levelButtonAction:(CCMenuItem*)sender {
    [[CCDirector sharedDirector] replaceScene:[GameScene node]];
    //[[GameManager sharedManager] pushScene:GameSceneEnum];
    
    
}
@end
