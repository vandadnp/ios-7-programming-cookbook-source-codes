//
//  ViewController.m
//  Handling Local System Notifications
//
//  Created by Vandad NP on 22/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void) orientationChanged:(NSNotification *)paramNotification{
    NSLog(@"Orientation Changed");
}

- (void)viewDidAppear:(BOOL)paramAnimated{
    
    [super viewDidAppear:paramAnimated];
    
    /* Listen for the notification */
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:nil];
    
}

- (void) viewDidDisappear:(BOOL)paramAnimated{
    [super viewDidDisappear:paramAnimated];
    
    /* Stop listening for the notification */
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:UIDeviceOrientationDidChangeNotification
     object:nil];
    
}

@end
