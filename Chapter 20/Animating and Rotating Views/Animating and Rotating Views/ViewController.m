//
//  ViewController.m
//  Animating and Rotating Views
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *xcodeImageView;
@end

@implementation ViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    
    UIImage *xcodeImage = [UIImage imageNamed:@"Xcode"];
    
    self.xcodeImageView = [[UIImageView alloc]
                           initWithImage:xcodeImage];
    
    /* Just set the size to make the image smaller */
    [self.xcodeImageView setFrame:CGRectMake(0.0f,
                                             0.0f,
                                             100.0f,
                                             100.0f)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.xcodeImageView];
    
}

- (void)clockwiseRotationStopped:(NSString *)paramAnimationID
                        finished:(NSNumber *)paramFinished
                         context:(void *)paramContext{
    
    [UIView beginAnimations:@"counterclockwiseAnimation"
                    context:NULL];
    
    /* 5 seconds long */
    [UIView setAnimationDuration:5.0f];
    
    /* Back to original rotation */
    self.xcodeImageView.transform = CGAffineTransformIdentity;
    
    [UIView commitAnimations];
    
}

- (void) viewDidAppear:(BOOL)paramAnimated{
    [super viewDidAppear:paramAnimated];
    
    self.xcodeImageView.center = self.view.center;
    
    /* Begin the animation */
    [UIView beginAnimations:@"clockwiseAnimation"
                    context:NULL];
    
    /* Make the animation 5 seconds long */
    [UIView setAnimationDuration:5.0f];
    
    [UIView setAnimationDelegate:self];
    
    [UIView setAnimationDidStopSelector:
     @selector(clockwiseRotationStopped:finished:context:)];
    
    /* Rotate the image view 90 degrees */
    self.xcodeImageView.transform =
    CGAffineTransformMakeRotation((90.0f * M_PI) / 180.0f);
    
    /* Commit the animation */
    [UIView commitAnimations];
    
}

@end
