//
//  ViewController.m
//  Detecting Tap Gestures
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)
    UITapGestureRecognizer *tapGestureRecognizer;
@end

@implementation ViewController

- (void) handleTaps:(UITapGestureRecognizer*)paramSender{
    
    NSUInteger touchCounter = 0;
    for (touchCounter = 0;
         touchCounter < paramSender.numberOfTouchesRequired;
         touchCounter++){
        CGPoint touchPoint =
        [paramSender locationOfTouch:touchCounter
                              inView:paramSender.view];
        NSLog(@"Touch #%lu: %@",
              (unsigned long)touchCounter+1,
              NSStringFromCGPoint(touchPoint));
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Create the Tap Gesture Recognizer */
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                 initWithTarget:self
                                 action:@selector(handleTaps:)];
    
    /* The number of fingers that must be on the screen */
    self.tapGestureRecognizer.numberOfTouchesRequired = 2;
    
    /* The total number of taps to be performed before the
     gesture is recognized */
    self.tapGestureRecognizer.numberOfTapsRequired = 3;
    
    /* Add this gesture recognizer to our view */
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
}

@end
