//
//  ViewController.m
//  Detecting Shakes on an iOS Device
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/* 1 */
//- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
//    /* Handle the motion */
//}

/* 2 */
- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake){
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"Shake"
                                   message:@"The device is shaken"
                                  delegate:nil
                         cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
