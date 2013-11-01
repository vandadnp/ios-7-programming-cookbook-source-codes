//
//  ViewController.m
//  Customizing the UISwitch
//
//  Created by Vandad NP on 22/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISwitch *mainSwitch;
@end

@implementation ViewController

/* 1 */
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view, typically from a nib.
//
//    /* Create the switch */
//    self.mainSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
//    self.mainSwitch.center = self.view.center;
//    [self.view addSubview:self.mainSwitch];
//
//    /* Customize the switch */
//
//    /* Adjust the off-mode tint color */
//    self.mainSwitch.tintColor = [UIColor redColor];
//    /* Adjust the on-mode tint color */
//    self.mainSwitch.onTintColor = [UIColor brownColor];
//    /* Also change the knob's tint color */
//    self.mainSwitch.thumbTintColor = [UIColor greenColor];
//
//}

/* 2 */
/* Note: This is only for iOS 6 and older */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /* Create the switch */
    self.mainSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    self.mainSwitch.center = self.view.center;
    /* Make sure the switch won't appear blurry on iOS Simulator */
    [self.view addSubview:self.mainSwitch];
    
    /* Customize the switch */
    self.mainSwitch.onImage = [UIImage imageNamed:@"On"];
    self.mainSwitch.offImage = [UIImage imageNamed:@"Off"];
    
}


@end
