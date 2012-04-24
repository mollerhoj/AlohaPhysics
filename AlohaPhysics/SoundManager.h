//
//  SoundManager.h
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleAudioEngine.h"

@interface SoundManager : NSObject {
    SimpleAudioEngine *soundEngine;
}
    
+(SoundManager*) sharedManager;

-(void)testAudio;

-(void)setup;

enum {
    DIE,
    WIN,
    HIT,
} typedef Sounds;

-(void)playSound:(Sounds)sound;

@end