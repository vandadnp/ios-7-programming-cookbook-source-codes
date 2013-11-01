//
//  ViewController.m
//  Recording Audio
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate, AVAudioRecorderDelegate>
@property (nonatomic, strong) AVAudioRecorder *audioRecorder;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@end

@implementation ViewController

- (NSURL *) audioRecordingPath{
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    NSURL *documentsFolderUrl =
    [fileManager URLForDirectory:NSDocumentDirectory
                        inDomain:NSUserDomainMask
               appropriateForURL:nil
                          create:NO
                           error:nil];
    
    return [documentsFolderUrl
            URLByAppendingPathComponent:@"Recording.m4a"];
    
}

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
        /* This is not our player */
    }
    
}

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder
                           successfully:(BOOL)flag{
    
    if (flag){
        
        NSLog(@"Successfully stopped the audio recording process.");
        
        /* Let's try to retrieve the data for the recorded file */
        NSError *playbackError = nil;
        
        NSError *readingError = nil;
        NSData  *fileData =
        [NSData dataWithContentsOfURL:[self audioRecordingPath]
                               options:NSDataReadingMapped
                                 error:&readingError];
        
        /* Form an audio player and make it play the recorded data */
        self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData
                                                         error:&playbackError];
        
        /* Could we instantiate the audio player? */
        if (self.audioPlayer != nil){
            self.audioPlayer.delegate = self;
            
            /* Prepare to play and start playing */
            if ([self.audioPlayer prepareToPlay] &&
                [self.audioPlayer play]){
                NSLog(@"Started playing the recorded audio.");
            } else {
                NSLog(@"Could not play the audio.");
            }
            
        } else {
            NSLog(@"Failed to create an audio player.");
        }
        
    } else {
        NSLog(@"Stopping the audio recording failed.");
    }
    
    /* Here we don't need the audio recorder anymore */
    self.audioRecorder = nil;
    
}

- (void) stopRecordingOnAudioRecorder:(AVAudioRecorder *)paramRecorder{
    
    /* Just stop the audio recorder here */
    [paramRecorder stop];
    
}

- (NSDictionary *) audioRecordingSettings{
    
    /* Let's prepare the audio recorder options in the dictionary.
     Later we will use this dictionary to instantiate an audio
     recorder of type AVAudioRecorder */
    
    return @{
             AVFormatIDKey : @(kAudioFormatAppleLossless),
             AVSampleRateKey : @(44100.0f),
             AVNumberOfChannelsKey : @1,
             AVEncoderAudioQualityKey : @(AVAudioQualityLow),
             };
    
}

- (void) startRecordingAudio{
    
    NSError   *error = nil;
    
    NSURL *audioRecordingURL = [self audioRecordingPath];
    
    self.audioRecorder = [[AVAudioRecorder alloc]
                          initWithURL:audioRecordingURL
                          settings:[self audioRecordingSettings]
                          error:&error];
    
    if (self.audioRecorder != nil){
        
        self.audioRecorder.delegate = self;
        /* Prepare the recorder and then start the recording */
        
        if ([self.audioRecorder prepareToRecord] &&
            [self.audioRecorder record]){
            NSLog(@"Successfully started to record.");
            
            /* After 5 seconds, let's stop the recording process */
            [self performSelector:@selector(stopRecordingOnAudioRecorder:)
                       withObject:self.audioRecorder
                       afterDelay:5.0f];
            
        } else {
            NSLog(@"Failed to record.");
            self.audioRecorder = nil;
        }
        
    } else {
        NSLog(@"Failed to create an instance of the audio recorder.");
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Ask for permission to see if we can record audio */
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    [session setCategory:AVAudioSessionCategoryPlayAndRecord
             withOptions:AVAudioSessionCategoryOptionDuckOthers
                   error:nil];
    
    if ([session requestRecordPermission]){
        [self startRecordingAudio];
    } else {
        NSLog(@"We don't have permission to record audio.");
    }
    
}

@end
