//
//  ViewController.m
//  Displaying Static Text with UILabel
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *myLabel;
@end

@implementation ViewController

/* 1 */
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    CGRect labelFrame = CGRectMake(0.0f,
//                                   0.0f,
//                                   100.0f,
//                                   23.0f);
//    self.myLabel = [[UILabel alloc] initWithFrame:labelFrame];
//    self.myLabel.text = @"iOS 7 Programming Cookbook";
//    self.myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
//    self.myLabel.center = self.view.center;
//    [self.view addSubview:self.myLabel];
//    
//}

/* 2 */
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    CGRect labelFrame = CGRectMake(0.0f,
//                                   0.0f,
//                                   100.0f,
//                                   50.0f);
//    self.myLabel = [[UILabel alloc] initWithFrame:labelFrame];
//    self.myLabel.text = @"iOS 7 Programming Cookbook";
//    self.myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
//    self.myLabel.center = self.view.center;
//    [self.view addSubview:self.myLabel];
//
//}

/* 3 */
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    CGRect labelFrame = CGRectMake(0.0f,
//                                   0.0f,
//                                   100.0f,
//                                   70.0f);
//    self.myLabel = [[UILabel alloc] initWithFrame:labelFrame];
//    self.myLabel.numberOfLines = 3;
//    self.myLabel.lineBreakMode = NSLineBreakByWordWrapping;
//    self.myLabel.text = @"iOS 7 Programming Cookbook";
//    self.myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
//    self.myLabel.center = self.view.center;
//    [self.view addSubview:self.myLabel];
//    
//}
    
/* 4 */
- (void)viewDidLoad{
    [super viewDidLoad];
    
    CGRect labelFrame = CGRectMake(0.0f,
                                   0.0f,
                                   100.0f,
                                   23.0f);
    self.myLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.myLabel.adjustsFontSizeToFitWidth = YES;
    self.myLabel.text = @"iOS 7 Programming Cookbook";
    self.myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    self.myLabel.center = self.view.center;
    [self.view addSubview:self.myLabel];
    
}

@end
