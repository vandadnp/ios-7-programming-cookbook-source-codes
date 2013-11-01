//
//  ViewController.m
//  Adding Buttons to Navigation Bars Using UIBarButtonItem
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/* 1 */
//- (void) performAdd:(id)paramSender{
//    NSLog(@"Action method got called.");
//}
//    
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    self.title = @"First Controller";
//    
//    self.navigationItem.rightBarButtonItem =
//    [[UIBarButtonItem alloc] initWithTitle:@"Add"
//                                     style:UIBarButtonItemStylePlain
//                                    target:self
//                                    action:@selector(performAdd:)];
//}

/* 2 */
//- (void) performAdd:(id)paramSender{
//    NSLog(@"Action method got called.");
//}
//    
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    self.title = @"First Controller";
//    
//    self.navigationItem.rightBarButtonItem =
//    [[UIBarButtonItem alloc]
//     initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
//     target:self
//     action:@selector(performAdd:)];
//}

/* 3 */
//- (void) switchIsChanged:(UISwitch *)paramSender{
//    if ([paramSender isOn]){
//        NSLog(@"Switch is on.");
//    } else {
//        NSLog(@"Switch is off.");
//    }
//}
//    
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//    self.title = @"First Controller";
//    
//    UISwitch *simpleSwitch = [[UISwitch alloc] init];
//    simpleSwitch.on = YES;
//    [simpleSwitch addTarget:self
//                     action:@selector(switchIsChanged:)
//           forControlEvents:UIControlEventValueChanged];
//    
//    self.navigationItem.rightBarButtonItem =
//    [[UIBarButtonItem alloc] initWithCustomView:simpleSwitch];
//}

/* 4 */
//- (void) segmentedControlTapped:(UISegmentedControl *)paramSender{
//    
//    switch (paramSender.selectedSegmentIndex){
//        case 0:{
//            NSLog(@"Up");
//            break;
//        }
//        case 1:{
//            NSLog(@"Down");
//            break;
//        }
//    }
//
//}
//    
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    self.title = @"First Controller";
//    
//    NSArray *items = @[
//                       @"Up",
//                       @"Down"
//                       ];
//    
//    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]
//                                            initWithItems:items];
//    
//    segmentedControl.momentary = YES;
//    
//    [segmentedControl addTarget:self
//                         action:@selector(segmentedControlTapped:)
//               forControlEvents:UIControlEventValueChanged];
//    
//    self.navigationItem.rightBarButtonItem =
//    [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
//    
//}
    
/* 5 */
    
- (void) segmentedControlTapped:(UISegmentedControl *)paramSender{
    
    switch (paramSender.selectedSegmentIndex){
        case 0:{
            NSLog(@"Up");
            break;
        }
        case 1:{
            NSLog(@"Down");
            break;
        }
    }
    
}
    
- (void)viewDidLoad{
    [super viewDidLoad];

    self.title = @"First Controller";
    
    NSArray *items = @[
                       @"Up",
                       @"Down"
                       ];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]
                                            initWithItems:items];
    
    segmentedControl.momentary = YES;
    
    [segmentedControl addTarget:self
                         action:@selector(segmentedControlTapped:)
               forControlEvents:UIControlEventValueChanged];
    
UIBarButtonItem *rightBarButton =
[[UIBarButtonItem alloc] initWithCustomView:segmentedControl];

[self.navigationItem setRightBarButtonItem:rightBarButton
                                  animated:YES];
    
}

@end
