//
//  HelloWorldLayer.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 15/04/2012.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
	b2World* world;
	GLESDebugDraw *m_debugDraw;
}

// NEW CODE
@property (nonatomic, retain) UILabel *touchStatusLabel;
@property (nonatomic, retain) NSTimer *touchTimer;
// NEW CODE END

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
// adds a new sprite at a given coordinate
-(void) addNewSpriteWithCoords:(CGPoint)p;

@end
