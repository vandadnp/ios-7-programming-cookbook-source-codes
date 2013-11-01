//
//  ViewController.m
//  Playing Video Files
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@property (nonatomic, strong) UIButton *playButton;
@end

@implementation ViewController

//- (IBAction) startPlayingVideo:(id)paramSender{
//    
//    NSBundle *mainBundle = [NSBundle mainBundle];
//    
//    NSURL    *url = [mainBundle URLForResource:@"Sample"
//                                 withExtension:@"m4v"];
//    
//    MPMoviePlayerController *newMoviePlayer =
//    [[MPMoviePlayerController alloc] initWithContentURL:url];
//    
//    self.moviePlayer = newMoviePlayer;
//    
//    if (self.moviePlayer != nil){
//        
//        self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
//        
//        UIView *playerView = self.moviePlayer.view;
//        playerView.frame = self.view.bounds;
//        
//        [self.moviePlayer setFullscreen:YES animated:NO];
//        
//        [self.view addSubview:playerView];
//        
//        [self.moviePlayer play];
//        
//        NSLog(@"Successfully instantiated the movie player.");
//        
//    } else {
//        NSLog(@"Failed to instantiate the movie player.");
//    }
//    
//}

/* -------------------------- */

- (void) videoHasFinishedPlaying:(NSNotification *)paramNotification{
    
    /* Find out what the reason was for the player to stop */
    NSNumber *reason =
    paramNotification.userInfo
    [MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
    
    if (reason != nil){
        NSInteger reasonAsInteger = [reason integerValue];
        
        switch (reasonAsInteger){
            case MPMovieFinishReasonPlaybackEnded:{
                /* The movie ended normally */
                break;
            }
            case MPMovieFinishReasonPlaybackError:{
                /* An error happened and the movie ended */
                break;
            }
            case MPMovieFinishReasonUserExited:{
                /* The user exited the player */
                break;
            }
        }
        
        NSLog(@"Finish Reason = %ld", (long)reasonAsInteger);
        [self stopPlayingVideo:nil];
    }
    
}

- (void) startPlayingVideo:(id)paramSender{
    
    /* First let's construct the URL of the file in our application bundle
     that needs to get played by the movie player */
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSURL *url = [mainBundle URLForResource:@"Sample"
                              withExtension:@"m4v"];
    
    /* If we have already created a movie player before,
     let's try to stop it */
    if (self.moviePlayer != nil){
        [self stopPlayingVideo:nil];
    }
    
    /* Now create a new movie player using the URL */
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    if (self.moviePlayer != nil){
        
        /* Listen for the notification that the movie player sends us
         whenever it finishes playing an audio file */
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(videoHasFinishedPlaying:)
         name:MPMoviePlayerPlaybackDidFinishNotification
         object:self.moviePlayer];
        
        NSLog(@"Successfully instantiated the movie player.");
        
        /* Scale the movie player to fit the aspect ratio */
        self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
        
        [self.view addSubview:self.moviePlayer.view];
        
        [self.moviePlayer setFullscreen:YES
                               animated:NO];
        
        /* Let's start playing the video in full screen mode */
        [self.moviePlayer play];
        
    } else {
        NSLog(@"Failed to instantiate the movie player.");
    }
    
}

- (void) stopPlayingVideo:(id)paramSender {
    
    if (self.moviePlayer != nil){
        
        [[NSNotificationCenter defaultCenter]
         removeObserver:self
         name:MPMoviePlayerPlaybackDidFinishNotification
         object:self.moviePlayer];
        
        [self.moviePlayer stop];
        
        [self.moviePlayer.view removeFromSuperview];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playButton.frame = CGRectMake(0.0f,
                                       0.0f,
                                       70.0f,
                                       37.0f);
    self.playButton.center = self.view.center;
    
    self.playButton.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleRightMargin;
    
    [self.playButton addTarget:self
                        action:@selector(startPlayingVideo:)
              forControlEvents:UIControlEventTouchUpInside];
    [self.playButton setTitle:@"Play"
                     forState:UIControlStateNormal];
    [self.view addSubview:self.playButton];
    
}

@end
