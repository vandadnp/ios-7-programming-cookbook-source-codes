//
//  ViewController.m
//  Implementing Range Pickers with UISlider
//
//  Created by Vandad NP on 22/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISlider *mySlider;
@end

@implementation ViewController

/* 1 */
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    self.mySlider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f,
//                                                               0.0f,
//                                                               200.0f,
//                                                               23.0f)];
//    self.mySlider.center = self.view.center;
//    self.mySlider.minimumValue = 0.0f;
//    self.mySlider.maximumValue = 100.0f;
//    self.mySlider.value = self.mySlider.maximumValue / 2.0;
//    [self.view addSubview:self.mySlider];
//}

/* 2 */
//- (void) sliderValueChanged:(UISlider *)paramSender{
//    
//    if ([paramSender isEqual:self.mySlider]){
//        NSLog(@"New value = %f", paramSender.value);
//    }
//    
//}
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    self.mySlider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f,
//                                                               0.0f,
//                                                               200.0f,
//                                                               23.0f)];
//    self.mySlider.center = self.view.center;
//    self.mySlider.minimumValue = 0.0f;
//    self.mySlider.maximumValue = 100.0f;
//    self.mySlider.value = self.mySlider.maximumValue / 2.0;
//    [self.view addSubview:self.mySlider];
//    
//    [self.mySlider addTarget:self
//                      action:@selector(sliderValueChanged:)
//            forControlEvents:UIControlEventValueChanged];
//}

/* 3 */
- (void)viewDidLoad{
    [super viewDidLoad];
    self.mySlider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f,
                                                               0.0f,
                                                               200.0f,
                                                               23.0f)];
    self.mySlider.center = self.view.center;
    self.mySlider.minimumValue = 0.0f;
    self.mySlider.maximumValue = 100.0f;
    self.mySlider.value = self.mySlider.maximumValue / 2.0;
    [self.view addSubview:self.mySlider];
    
[self.mySlider setThumbImage:[UIImage imageNamed:@"ThumbNormal.png"]
                    forState:UIControlStateNormal];
[self.mySlider setThumbImage:[UIImage imageNamed:@"ThumbHighlighted.png"]
                    forState:UIControlStateHighlighted];
    
}

@end
