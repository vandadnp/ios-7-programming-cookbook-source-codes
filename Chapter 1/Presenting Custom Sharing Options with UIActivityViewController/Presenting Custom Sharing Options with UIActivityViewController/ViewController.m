//
//  ViewController.m
//  Presenting Custom Sharing Options with UIActivityViewController
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import "StringReverserActivity.h"

@implementation ViewController

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSArray *itemsToShare = @[
                              @"Item 1",
                              @"Item 2",
                              @"Item 3",
                              ];
    
    UIActivityViewController *activity =
        [[UIActivityViewController alloc]
         initWithActivityItems:itemsToShare
         applicationActivities:@[[StringReverserActivity new]]];
    
    [self presentViewController:activity animated:YES completion:nil];
}

@end
