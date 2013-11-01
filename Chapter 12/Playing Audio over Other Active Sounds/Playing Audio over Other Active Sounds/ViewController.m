//
//  ViewController.m
//  Playing Audio over Other Active Sounds
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate>
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@end

@implementation ViewController

- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player{
    /* The audio session has been deactivated here */
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player
                       withOptions:(NSUInteger)flags{
    if (flags == AVAudioSessionInterruptionOptionShouldResume){
        [player play];
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
                       successfully:(BOOL)flag{
    
    if (flag){
        NSLog(@"Audio player stopped correctly.");
    } else {
        NSLog(@"Audio player did not stop correctly.");
    }
    
    if ([player isEqual:self.audioPlayer]){
        self.audioPlayer = nil;
    } else {
        /* This is not our audio player */
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *audioSessionError = nil;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if ([audioSession setCategory:AVAudioSessionCategoryAmbient
                            error:&audioSessionError]){
        NSLog(@"Successfully set the audio session.");
    } else {
        NSLog(@"Could not set the audio session");
    }
    
    dispatch_queue_t dispatchQueue =
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(dispatchQueue, ^(void) {
        NSBundle *mainBundle = [NSBundle mainBundle];
        
        NSString *filePath = [mainBundle pathForResource:@"MySong"
                                                  ofType:@"mp3"];
        
        NSData *fileData = [NSData dataWithContentsOfFile:filePath];
        
        NSError *audioPlayerError = nil;
        
        self.audioPlayer = [[AVAudioPlayer alloc]
                            initWithData:fileData
                            error:&audioPlayerError];
        
        if (self.audioPlayer != nil){
            
            self.audioPlayer.delegate = self;
            
            if ([self.audioPlayer prepareToPlay] &&
                [self.audioPlayer play]){
                NSLog(@"Successfully started playing.");
                
            } else {
                NSLog(@"Failed to play the audio file.");
                self.audioPlayer = nil;
            }
            
        } else {
            NSLog(@"Could not instantiate the audio player.");
        }
    });
    
}

@end
