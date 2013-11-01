//
//  ViewController.m
//  Picking Date and Time with UIDatePicker
//
//  Created by Vandad NP on 22/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIDatePicker *myDatePicker;
@end

@implementation ViewController

/* 1 */
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    self.myDatePicker = [[UIDatePicker alloc] init];
//    self.myDatePicker.center = self.view.center;
//    [self.view addSubview:self.myDatePicker];
//}

/* 2 */
//NSDate *currentDate = self.myDatePicker.date;
//NSLog(@"Date = %@", currentDate);

/* 3 */
//- (void) datePickerDateChanged:(UIDatePicker *)paramDatePicker{
//    
//    if ([paramDatePicker isEqual:self.myDatePicker]){
//        NSLog(@"Selected date = %@", paramDatePicker.date);
//    }
//    
//}
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    self.myDatePicker = [[UIDatePicker alloc] init];
//    self.myDatePicker.center = self.view.center;
//    [self.view addSubview:self.myDatePicker];
//    
//    [self.myDatePicker addTarget:self
//                          action:@selector(datePickerDateChanged:)
//                forControlEvents:UIControlEventValueChanged];
//    
//}

/* 4 */
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    self.myDatePicker = [[UIDatePicker alloc] init];
//    self.myDatePicker.center = self.view.center;
//    self.myDatePicker.datePickerMode = UIDatePickerModeDate;
//    [self.view addSubview:self.myDatePicker];
//    
//    
//    NSTimeInterval oneYearTime = 365 * 24 * 60 * 60;
//    NSDate *todayDate = [NSDate date];
//    
//    NSDate *oneYearFromToday = [todayDate
//                                dateByAddingTimeInterval:oneYearTime];
//    
//    NSDate *twoYearsFromToday = [todayDate
//                                 dateByAddingTimeInterval:2 * oneYearTime];
//    
//    self.myDatePicker.minimumDate = oneYearFromToday;
//    self.myDatePicker.maximumDate = twoYearsFromToday;
//}

/* 5 */
- (void)viewDidLoad{
    [super viewDidLoad];
    self.myDatePicker = [[UIDatePicker alloc] init];
    self.myDatePicker.center = self.view.center;
    self.myDatePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    [self.view addSubview:self.myDatePicker];
    
    NSTimeInterval twoMinutes = 2 * 60;
    [self.myDatePicker setCountDownDuration:twoMinutes];
}

@end
