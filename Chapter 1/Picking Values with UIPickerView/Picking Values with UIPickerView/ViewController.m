//
//  ViewController.m
//  Picking Values with UIPickerView
//
//  Created by Vandad NP on 22/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) UIPickerView *myPicker;
@end

@implementation ViewController

/* 1 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//
//  self.myPicker = [[UIPickerView alloc] init];
//  self.myPicker.center = self.view.center;
//  [self.view addSubview:self.myPicker];
//
//}

/* 2 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//
//  self.myPicker = [[UIPickerView alloc] init];
//  self.myPicker.dataSource = self;
//  self.myPicker.center = self.view.center;
//  [self.view addSubview:self.myPicker];
//
//}

/* 3 */
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    self.myPicker = [[UIPickerView alloc] init];
//    self.myPicker.dataSource = self;
//    self.myPicker.center = self.view.center;
//    [self.view addSubview:self.myPicker];
//    
//}
//
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//    
//    if ([pickerView isEqual:self.myPicker]){
//        return 1;
//    }
//    
//    return 0;
//    
//}
//
//- (NSInteger)   pickerView:(UIPickerView *)pickerView
//   numberOfRowsInComponent:(NSInteger)component{
//    
//    if ([pickerView isEqual:self.myPicker]){
//        return 10;
//    }
//    
//    return 0;
//}

/* 4 */
//- (NSString *)pickerView:(UIPickerView *)pickerView
//             titleForRow:(NSInteger)row
//            forComponent:(NSInteger)component{
//    
//    if ([pickerView isEqual:self.myPicker]){
//        
//        /* Row is zero-based and we want the first row (with index 0)
//         to be rendered as Row 1 so we have to +1 every row index */
//        return [NSString stringWithFormat:@"Row %ld", (long)row + 1];
//        
//    }
//    
//    return nil;
//    
//}
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    self.myPicker = [[UIPickerView alloc] init];
//    self.myPicker.dataSource = self;
//    self.myPicker.delegate = self;
//    self.myPicker.center = self.view.center;
//    [self.view addSubview:self.myPicker];
//    
//}
//
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//    
//    if ([pickerView isEqual:self.myPicker]){
//        return 1;
//    }
//    return 0;
//    
//}
//
//- (NSInteger)   pickerView:(UIPickerView *)pickerView
//   numberOfRowsInComponent:(NSInteger)component{
//    
//    if ([pickerView isEqual:self.myPicker]){
//        return 10;
//    }
//    return 0;
//    
//}

/* 5 */
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
    
    if ([pickerView isEqual:self.myPicker]){
        
        /* Row is zero-based and we want the first row (with index 0)
         to be rendered as Row 1 so we have to +1 every row index */
        return [NSString stringWithFormat:@"Row %ld", (long)row + 1];
        
    }
    
    return nil;
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
	
    self.myPicker = [[UIPickerView alloc] init];
    self.myPicker.showsSelectionIndicator = NO;
    self.myPicker.dataSource = self;
    self.myPicker.delegate = self;
    self.myPicker.center = self.view.center;
    [self.view addSubview:self.myPicker];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    if ([pickerView isEqual:self.myPicker]){
        return 1;
    }
    return 0;

}

- (NSInteger)   pickerView:(UIPickerView *)pickerView
   numberOfRowsInComponent:(NSInteger)component{

    if ([pickerView isEqual:self.myPicker]){
        return 10;
    }
    return 0;

}

@end
