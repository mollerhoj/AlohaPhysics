//
//  SoundManager.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// Managing sounds and music, loads the music in a different thread

#import "SoundManager.h"

@interface SoundManager()
@property BOOL hasAudioBeenInitialized;
@property BOOL soundReady;
@end

@implementation SoundManager

@synthesize hasAudioBeenInitialized = _hasAudioBeenInitialized;
@synthesize soundReady = _soundReady;

#define BACKGROUND_MUSIC @"Chill.mp3"

#define WIN_SOUND @"Win.wav"
#define DIE_SOUND @"Die.wav"
#define HIT_SOUND @"Hit.WAV"

static SoundManager *sharedManager = nil;

+(SoundManager*) sharedManager
{
	@synchronized(self)     {
		if (!sharedManager)
			sharedManager = [[SoundManager alloc] init];
	}
	return sharedManager;
}

-(id)init
{
	if( (self=[super init])) {
        self.soundReady = NO;
	}
	return self;
}

//Setup the sounds
-(void)setup {
    if (self.hasAudioBeenInitialized == YES) {
        return;
    } else {
        self.hasAudioBeenInitialized = YES;
        NSOperationQueue *queue = [[NSOperationQueue new] autorelease];
        NSInvocationOperation *asyncSetupOperation =
        [[NSInvocationOperation alloc] initWithTarget:self
                                             selector:@selector(initAudioAsync)
                                               object:nil];
        [queue addOperation:asyncSetupOperation];
        [asyncSetupOperation autorelease];
    }
}

//Init the sounds (happens in another tread)
-(void)initAudioAsync {
    // Initializes the audio engine asynchronously
    // Indicate that we are trying to start up the Audio Manager
    [CDSoundEngine setMixerSampleRate:CD_SAMPLE_RATE_MID];
    //Init audio manager asynchronously as it can take a few seconds
    //The FXPlusMusicIfNoOtherAudio mode will check if the user is
    // playing music and disable background music playback if
    // that is the case.
    [CDAudioManager initAsynchronously:kAMM_FxPlusMusicIfNoOtherAudio];
    //Wait for the audio manager to initialize
    while ([CDAudioManager sharedManagerState] != kAMStateInitialised)
    {
        [NSThread sleepForTimeInterval:0.1];
    }
    //At this point the CocosDenshion should be initialized
    // Grab the CDAudioManager and check the state
    CDAudioManager *audioManager = [CDAudioManager sharedManager];
    if (audioManager.soundEngine == nil || audioManager.soundEngine.functioning == NO) {
        //NSLOG(@"CocosDenshion failed to init, no audio will play.");
    } else {
        [audioManager setResignBehavior:kAMRBStopPlay autoHandle:YES];
        soundEngine = [SimpleAudioEngine sharedEngine];
        [self loadSounds];
        self.soundReady = YES;
        [self playMusic];
        //NSLOG(@"Sounds ready to be played");
    }
}

//Loads and plays music
-(void)playMusic {
    if ([soundEngine isBackgroundMusicPlaying]) {
        [soundEngine stopBackgroundMusic];
    }
    
    [soundEngine preloadBackgroundMusic:BACKGROUND_MUSIC];
    [soundEngine playBackgroundMusic:BACKGROUND_MUSIC];    
}

//Loads the sounds
-(void)loadSounds {
    [soundEngine preloadBackgroundMusic:WIN_SOUND];
    [soundEngine preloadBackgroundMusic:DIE_SOUND];
    [soundEngine preloadBackgroundMusic:HIT_SOUND];
}

//If the sounds are ready, a sound will be played
-(void)playSound:(Sounds)sound {
    if (self.soundReady) {
        switch (sound) {
            case (WIN):
                [soundEngine playEffect:WIN_SOUND];
                break;
                
            case (DIE):
                [soundEngine playEffect:DIE_SOUND];
                break;
                
            case (HIT):
                [soundEngine playEffect:HIT_SOUND];
                break;
            default:
                break;
        }
    }
}

@end
