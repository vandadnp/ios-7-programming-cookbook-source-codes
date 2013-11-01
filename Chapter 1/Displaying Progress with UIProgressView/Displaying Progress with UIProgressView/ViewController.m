//
//  ViewController.m
//  Displaying Progress with UIProgressView
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.progressView = [[UIProgressView alloc]
                         initWithProgressViewStyle:UIProgressViewStyleBar];
    self.progressView.center = self.view.center;
    self.progressView.progress = 20.0f / 30.0f;
    [self.view addSubview:self.progressView];
    
}

@end
