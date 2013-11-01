//
//  ViewController.m
//  Grouping Compact Options with UISegmentedControl
//
//  Created by Vandad NP on 22/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISegmentedControl *mySegmentedControl;
@end

@implementation ViewController

/* 1 */
//- (void)viewDidLoad{
//    [super viewDidLoad];
//
//    NSArray *segments = [[NSArray alloc] initWithObjects:
//                         @"iPhone",
//                         @"iPad",
//                         @"iPod",
//                         @"iMac", nil];
//
//    self.mySegmentedControl = [[UISegmentedControl alloc]
//                               initWithItems:segments];
//    self.mySegmentedControl.center = self.view.center;
//    [self.view addSubview:self.mySegmentedControl];
//
//}

/* 2 */
//- (void) segmentChanged:(UISegmentedControl *)paramSender{
//    
//    if ([paramSender isEqual:self.mySegmentedControl]){
//        NSInteger selectedSegmentIndex = [paramSender selectedSegmentIndex];
//        
//        NSString  *selectedSegmentText =
//        [paramSender titleForSegmentAtIndex:selectedSegmentIndex];
//        
//        NSLog(@"Segment %ld with %@ text is selected",
//              (long)selectedSegmentIndex,
//              selectedSegmentText);
//    }
//}
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    NSArray *segments = @[
//                          @"iPhone",
//                          @"iPad",
//                          @"iPod",
//                          @"iMac"
//                          ];
//    
//    self.mySegmentedControl = [[UISegmentedControl alloc]
//                               initWithItems:segments];
//    self.mySegmentedControl.center = self.view.center;
//    [self.view addSubview:self.mySegmentedControl];
//    
//    [self.mySegmentedControl addTarget:self
//                                action:@selector(segmentChanged:)
//                      forControlEvents:UIControlEventValueChanged];
//}

/* 3 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  NSArray *segments = [[NSArray alloc] initWithObjects:
//                       @"iPhone",
//                       @"iPad",
//                       @"iPod",
//                       @"iMac", nil];
//
//  self.mySegmentedControl = [[UISegmentedControl alloc]
//                             initWithItems:segments];
//  self.mySegmentedControl.center = self.view.center;
//  self.mySegmentedControl.momentary = YES;
//  [self.view addSubview:self.mySegmentedControl];
//}

/* 4 */
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    NSArray *segments = @[
//                          @"iPhone",
//                          [UIImage imageNamed:@"iPad"],
//                          @"iPod",
//                          @"iMac",
//                         ];
//    
//    self.mySegmentedControl = [[UISegmentedControl alloc]
//                               initWithItems:segments];
//    
//    CGRect segmentedFrame = self.mySegmentedControl.frame;
//    segmentedFrame.size.height = 128.0f;
//    segmentedFrame.size.width = 300.0f;
//    self.mySegmentedControl.frame = segmentedFrame;
//    
//    self.mySegmentedControl.center = self.view.center;
//    
//    [self.view addSubview:self.mySegmentedControl];
//}

/* 5 */
- (void)viewDidLoad{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    NSArray *segments = [[NSArray alloc] initWithObjects:
                         @"iPhone",
                         [UIImage imageNamed:@"iPad.png"],
                         @"iPod",
                         @"iMac", nil];

    self.mySegmentedControl = [[UISegmentedControl alloc]
                               initWithItems:segments];

    self.mySegmentedControl.segmentedControlStyle =
    UISegmentedControlStyleBezeled;

    CGRect segmentedFrame = self.mySegmentedControl.frame;
    segmentedFrame.size.height = 64.0f;
    segmentedFrame.size.width = 300.0f;
    self.mySegmentedControl.frame = segmentedFrame;

    self.mySegmentedControl.center = self.view.center;

    [self.view addSubview:self.mySegmentedControl];
}

@end
