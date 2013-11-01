//
//  ViewController.m
//  Detecting Swipe Gestures
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)
    UISwipeGestureRecognizer *swipeGestureRecognizer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Instantiate our object */
    self.swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(handleSwipes:)];
    
    /* Swipes that are performed from right to
     left are to be detected */
    self.swipeGestureRecognizer.direction =
    UISwipeGestureRecognizerDirectionLeft;
    
    /* Just one finger needed */
    self.swipeGestureRecognizer.numberOfTouchesRequired = 1;
    
    /* Add it to the view */
    [self.view addGestureRecognizer:self.swipeGestureRecognizer];
    
}

- (void) handleSwipes:(UISwipeGestureRecognizer *)paramSender{
    
    if (paramSender.direction & UISwipeGestureRecognizerDirectionDown){
        NSLog(@"Swiped Down.");
    }
    if (paramSender.direction & UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"Swiped Left.");
    }
    if (paramSender.direction & UISwipeGestureRecognizerDirectionRight){
        NSLog(@"Swiped Right.");
    }
    if (paramSender.direction & UISwipeGestureRecognizerDirectionUp){
        NSLog(@"Swiped Up.");
    }
    
}

@end
