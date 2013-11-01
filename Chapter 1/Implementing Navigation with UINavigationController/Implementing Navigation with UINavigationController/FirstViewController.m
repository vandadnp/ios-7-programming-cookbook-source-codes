//
//  FirstViewController.m
//  Implementing Navigation with UINavigationController
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
    @property (nonatomic, strong) UIButton *displaySecondViewController;
@end

@implementation FirstViewController
    
- (void) performDisplaySecondViewController:(id)paramSender{
    SecondViewController *secondController = [[SecondViewController alloc]
                                              initWithNibName:nil
                                              bundle:NULL];
    [self.navigationController pushViewController:secondController
                                         animated:YES];
}
    
- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"First Controller";
    
    self.displaySecondViewController = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.displaySecondViewController setTitle:@"Display Second View Controller"
                                      forState:UIControlStateNormal];
    [self.displaySecondViewController sizeToFit];
    self.displaySecondViewController.center = self.view.center;
    
    [self.displaySecondViewController addTarget:self
                                         action:@selector(performDisplaySecondViewController:)
                               forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.displaySecondViewController];
}

@end
