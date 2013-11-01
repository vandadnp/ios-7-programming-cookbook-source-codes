//
//  ViewController.m
//  Creating and Using Switches with UISwitch
//
//  Created by Vandad NP on 22/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISwitch *mySwitch;
@end

@implementation ViewController

/* 1 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//
//  /* Create the switch */
//  self.mySwitch = [[UISwitch alloc] initWithFrame:
//                   CGRectMake(100, 100, 0, 0)];
//
//  [self.view addSubview:self.mySwitch];
//
//}

/* 2 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//
//  /* Create the switch */
//  self.mySwitch = [[UISwitch alloc] initWithFrame:
//                   CGRectMake(100, 100, 0, 0)];
//  [self.mySwitch setOn:YES];
//  [self.view addSubview:self.mySwitch];
//
//}

/* 3 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//
//  /* Create the switch */
//  self.mySwitch = [[UISwitch alloc] initWithFrame:
//                   CGRectMake(100, 100, 0, 0)];
//  [self.mySwitch setOn:YES];
//  [self.view addSubview:self.mySwitch];
//
//  if ([self.mySwitch isOn]){
//    NSLog(@"The switch is on.");
//  } else {
//    NSLog(@"The switch is off.");
//  }
//
//}

/* 4 */
- (void) switchIsChanged:(UISwitch *)paramSender{
    
    NSLog(@"Sender is = %@", paramSender);
    
    if ([paramSender isOn]){
        NSLog(@"The switch is turned on.");
    } else {
        NSLog(@"The switch is turned off.");
    }
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
        
    /* Create the switch */
    self.mySwitch = [[UISwitch alloc] initWithFrame:
                     CGRectMake(100, 100, 0, 0)];
    [self.mySwitch setOn:YES];
    [self.view addSubview:self.mySwitch];
    
    [self.mySwitch addTarget:self
                      action:@selector(switchIsChanged:)
            forControlEvents:UIControlEventValueChanged];
    
}

@end
