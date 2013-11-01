//
//  ViewController.m
//  Adding gravity to your UI components
//
//  Created by Vandad NP on 04/07/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *squareView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
	
    /* Create our little square view and add it to self.view */
    self.squareView = [[UIView alloc] initWithFrame:
                       CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
    self.squareView.backgroundColor = [UIColor greenColor];
    self.squareView.center = self.view.center;
    [self.view addSubview:self.squareView];
    
    /* Create the animator and the gravity */
    self.animator = [[UIDynamicAnimator alloc]
                     initWithReferenceView:self.view];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]
                                  initWithItems:@[self.squareView]];
    
    [self.animator addBehavior:gravity];
    
}

@end
