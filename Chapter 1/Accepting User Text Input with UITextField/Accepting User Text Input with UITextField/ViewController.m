//
//  ViewController.m
//  Accepting User Text Input with UITextField
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

/* 1 */
//@interface ViewController ()
//@property (nonatomic, strong) UITextField *myTextField;
//@end
//
//@implementation ViewController
//    
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    CGRect textFieldFrame = CGRectMake(0.0f,
//                                       0.0f,
//                                       200.0f,
//                                       31.0f);
//    
//    self.myTextField = [[UITextField alloc]
//                        initWithFrame:textFieldFrame];
//    
//    self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
//    
//    self.myTextField.contentVerticalAlignment =
//    UIControlContentVerticalAlignmentCenter;
//    
//    self.myTextField.textAlignment = NSTextAlignmentCenter;
//    
//    self.myTextField.text = @"Sir Richard Branson";
//    self.myTextField.center = self.view.center;
//    [self.view addSubview:self.myTextField];
//    
//}

/* 2 */
//@interface ViewController () <UITextFieldDelegate>
//@property (nonatomic, strong) UITextField *myTextField;
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//
//  CGRect textFieldFrame = CGRectMake(0.0f,
//                                     0.0f,
//                                     200.0f,
//                                     31.0f);
//
//  self.myTextField = [[UITextField alloc]
//                      initWithFrame:textFieldFrame];
//
//  self.myTextField.delegate = self;
//
//  self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
//
//  self.myTextField.contentVerticalAlignment =
//    UIControlContentVerticalAlignmentCenter;
//
//  self.myTextField.textAlignment = NSTextAlignmentCenter;
//
//  self.myTextField.text = @"Sir Richard Branson";
//  self.myTextField.center = self.view.center;
//  [self.view addSubview:self.myTextField];
//
//}

@interface ViewController () <UITextFieldDelegate>
@property (nonatomic, strong) UITextField *myTextField;
@property (nonatomic, strong) UILabel *labelCounter;
@end

@implementation ViewController


/* 3 */
//- (void) calculateAndDisplayTextFieldLengthWithText:(NSString *)paramText{
//    
//    NSString *characterOrCharacters = @"Characters";
//    if ([paramText length] == 1){
//        characterOrCharacters = @"Character";
//    }
//    
//    self.labelCounter.text = [NSString stringWithFormat:@"%lu %@",
//                              (unsigned long)[paramText length],
//                              characterOrCharacters];
//}
//
//- (BOOL)                textField:(UITextField *)textField
//    shouldChangeCharactersInRange:(NSRange)range
//                replacementString:(NSString *)string{
//    
//    if ([textField isEqual:self.myTextField]){
//        NSString *wholeText =
//        [textField.text stringByReplacingCharactersInRange:range
//                                                withString:string];
//        [self calculateAndDisplayTextFieldLengthWithText:wholeText];
//    }
//    
//    return YES;
//    
//}
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
//    return YES;
//}
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    CGRect textFieldFrame = CGRectMake(38.0f,
//                                       30.0f,
//                                       220.0f,
//                                       31.0f);
//    
//    self.myTextField = [[UITextField alloc]
//                        initWithFrame:textFieldFrame];
//    
//    self.myTextField.delegate = self;
//    
//    self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
//    
//    self.myTextField.contentVerticalAlignment =
//        UIControlContentVerticalAlignmentCenter;
//    
//    self.myTextField.textAlignment = NSTextAlignmentCenter;
//    
//    self.myTextField.text = @"Sir Richard Branson";
//    
//    [self.view addSubview:self.myTextField];
//    
//    CGRect labelCounterFrame = self.myTextField.frame;
//    labelCounterFrame.origin.y += textFieldFrame.size.height + 10;
//    self.labelCounter = [[UILabel alloc] initWithFrame:labelCounterFrame];
//    [self.view addSubview:self.labelCounter];
//    
//    [self calculateAndDisplayTextFieldLengthWithText:self.myTextField.text];
//    
//}

/* 4 */
//- (void) calculateAndDisplayTextFieldLengthWithText:(NSString *)paramText{
//    
//    NSString *characterOrCharacters = @"Characters";
//    if ([paramText length] == 1){
//        characterOrCharacters = @"Character";
//    }
//    
//    self.labelCounter.text = [NSString stringWithFormat:@"%lu %@",
//                              (unsigned long)[paramText length],
//                              characterOrCharacters];
//}
//
//- (BOOL)                textField:(UITextField *)textField
//    shouldChangeCharactersInRange:(NSRange)range
//                replacementString:(NSString *)string{
//
//    if ([textField isEqual:self.myTextField]){
//        NSString *wholeText =
//        [textField.text stringByReplacingCharactersInRange:range
//                                                withString:string];
//        [self calculateAndDisplayTextFieldLengthWithText:wholeText];
//    }
//    
//    return YES;
//    
//}
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
//    return YES;
//}
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    CGRect textFieldFrame = CGRectMake(38.0f,
//                                       30.0f,
//                                       220.0f,
//                                       31.0f);
//    
//    self.myTextField = [[UITextField alloc]
//                        initWithFrame:textFieldFrame];
//    
//    self.myTextField.delegate = self;
//    
//    self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
//    
//    self.myTextField.contentVerticalAlignment =
//        UIControlContentVerticalAlignmentCenter;
//    
//    self.myTextField.textAlignment = NSTextAlignmentCenter;
//    
//    self.myTextField.placeholder = @"Enter text here...";
//    [self.view addSubview:self.myTextField];
//    
//    CGRect labelCounterFrame = self.myTextField.frame;
//    labelCounterFrame.origin.y += textFieldFrame.size.height + 10;
//    self.labelCounter = [[UILabel alloc] initWithFrame:labelCounterFrame];
//    [self.view addSubview:self.labelCounter];
//    
//    [self calculateAndDisplayTextFieldLengthWithText:self.myTextField.text];
//    
//}

/* 5 */
- (void)viewDidLoad{
    [super viewDidLoad];
    
    CGRect textFieldFrame = CGRectMake(38.0f,
                                       30.0f,
                                       240.0f,
                                       31.0f);
	
    self.myTextField = [[UITextField alloc]
                        initWithFrame:textFieldFrame];
    
    self.myTextField.keyboardType = UIKeyboardTypeDecimalPad;
    
    self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.myTextField.contentVerticalAlignment =
        UIControlContentVerticalAlignmentCenter;
    
    self.myTextField.textAlignment = NSTextAlignmentLeft;
    
    self.myTextField.placeholder = @"Enter amount here.";
    [self.view addSubview:self.myTextField];
    
    UILabel *currencyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    currencyLabel.text = [[[NSNumberFormatter alloc] init] currencySymbol];
    currencyLabel.font = self.myTextField.font;
    [currencyLabel sizeToFit];
    self.myTextField.leftView = currencyLabel;
    self.myTextField.leftViewMode = UITextFieldViewModeAlways;
    
}

@end