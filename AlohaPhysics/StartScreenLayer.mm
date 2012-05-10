//
//  StartScreenLayer.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 08/05/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "StartScreenLayer.h"
#import "GameScene.h"


@implementation StartScreenLayer

//Return a scene that contains this layer
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StartScreenLayer *layer = [StartScreenLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

//Setup the intro screen, and make a button
-(id) init
{
	if( (self=[super init])) {
        
        CCMenuItem *playButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"Sprite_levelButton1.png"]
                                                    selectedSprite:[CCSprite spriteWithSpriteFrameName:@"Sprite_levelButton2.png"]
                                                            target:self
                                                          selector:@selector(playButtonAction)];
        playButton.position=ccp(50,50);
        CCMenu *menu=[CCMenu menuWithItems:playButton,nil];
        menu.position=ccp(0,0);
        [self addChild:menu];
	}
	return self;
}

//What the play button does.
-(void)playButtonAction {
    [[CCDirector sharedDirector] replaceScene:[GameScene node]];
    //[[GameManager sharedManager] pushScene:GameSceneEnum];
}

@end
