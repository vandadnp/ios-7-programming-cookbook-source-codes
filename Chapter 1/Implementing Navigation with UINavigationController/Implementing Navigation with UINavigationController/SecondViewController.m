//
//  SecondViewController.m
//  Implementing Navigation with UINavigationController
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Second Controller";
}
    
- (void) goBack{
    [self.navigationController popViewControllerAnimated:YES];
}
    
- (void) viewDidAppear:(BOOL)paramAnimated{
    [super viewDidAppear:paramAnimated];
    [self performSelector:@selector(goBack)
               withObject:nil
               afterDelay:5.0f];
}

@end
