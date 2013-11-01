//
//  ViewController.m
//  Handling Interruptions While Playing Audio
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
    
    /* Audio Session is interrupted. The player will be paused here */
    
}

- (void) audioPlayerEndInterruption:(AVAudioPlayer *)player
                        withOptions:(NSUInteger)flags{
    
    if (flags == AVAudioSessionInterruptionOptionShouldResume &&
        player != nil){
        [player play];
    }
    
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
                       successfully:(BOOL)flag{
    
    NSLog(@"Finished playing the song");
    
    /* The [flag] parameter tells us if the playback was successfully
     finished or not */
    
    if ([player isEqual:self.audioPlayer]){
        self.audioPlayer = nil;
    } else {
        /* This is not our audio player! */
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t dispatchQueue =
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(dispatchQueue, ^(void) {
        NSBundle *mainBundle = [NSBundle mainBundle];
        
        NSString *filePath = [mainBundle pathForResource:@"MySong"
                                                  ofType:@"mp3"];
        
        NSData   *fileData = [NSData dataWithContentsOfFile:filePath];
        
        NSError  *error = nil;
        
        /* Start the audio player */
        self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData
                                                         error:&error];
        
        /* Did we get an instance of AVAudioPlayer? */
        if (self.audioPlayer != nil){
            /* Set the delegate and start playing */
            self.audioPlayer.delegate = self;
            if ([self.audioPlayer prepareToPlay]&&
                [self.audioPlayer play]){
                /* Successfully started playing */
            } else {
                /* Failed to play */
            }
        } else {
            /* Failed to instantiate AVAudioPlayer */
        }
    });
    
}

@end
