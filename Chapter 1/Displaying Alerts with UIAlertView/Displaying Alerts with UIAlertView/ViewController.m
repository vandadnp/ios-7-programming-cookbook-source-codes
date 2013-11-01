//
//  ViewController.m
//  Displaying Alerts with UIAlertView
//
//  Created by Vandad NP on 22/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>

@end

@implementation ViewController

/* 2 */
//- (NSString *) yesButtonTitle{
//    return @"Yes";
//}
//
//- (NSString *) noButtonTitle{
//    return @"No";
//}
//
//- (void)      alertView:(UIAlertView *)alertView
//   clickedButtonAtIndex:(NSInteger)buttonIndex{
//    
//    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
//    
//    if ([buttonTitle isEqualToString:[self yesButtonTitle]]){
//        NSLog(@"User pressed the Yes button.");
//    }
//    else if ([buttonTitle isEqualToString:[self noButtonTitle]]){
//        NSLog(@"User pressed the No button.");
//    }
//    
//}
//
//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    
//    
//    NSString *message = @"Are you sure you want to open this link in Safari?";
//    UIAlertView *alertView = [[UIAlertView alloc]
//                              initWithTitle:@"Open Link"
//                              message:message
//                              delegate:self
//                              cancelButtonTitle:[self noButtonTitle]
//                              otherButtonTitles:[self yesButtonTitle], nil];
//    [alertView show];
//    
//}

/* 1 */
//- (void) viewDidAppear:(BOOL)paramAnimated{
//    
//    [super viewDidAppear:paramAnimated];
//    
//    UIAlertView *alertView = [[UIAlertView alloc]
//                              initWithTitle:@"Alert"
//                              message:@"You've been delivered an alert"
//                              delegate:nil
//                              cancelButtonTitle:@"Cancel"
//                              otherButtonTitles:@"Ok", nil];
//    [alertView show];
//    
//}

/* 3 */
//- (void) viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    
//    UIAlertView *alertView = [[UIAlertView alloc]
//                              initWithTitle:@"Credit Card Number"
//                              message:@"Please enter your credit card number:"
//                              delegate:self
//                              cancelButtonTitle:@"Cancel"
//                              otherButtonTitles:@"Ok", nil];
//    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
//    
//    /* Display a numerical keypad for this text field */
//    UITextField *textField = [alertView textFieldAtIndex:0];
//    textField.keyboardType = UIKeyboardTypeNumberPad;
//    
//    [alertView show];
//    
//}

/* 4 */
- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Password"
                              message:@"Please enter your password:"
                              delegate:self
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"Ok", nil];
    
    [alertView setAlertViewStyle:UIAlertViewStyleSecureTextInput];
    [alertView show];
    
}

/* 5 */
//- (void) viewDidAppear:(BOOL)animated{
//  [super viewDidAppear:animated];
//
//  UIAlertView *alertView = [[UIAlertView alloc]
//                            initWithTitle:@"Password"
//                            message:@"Please enter your credentials:"
//                            delegate:self
//                            cancelButtonTitle:@"Cancel"
//                            otherButtonTitles:@"Ok", nil];
//
//  [alertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
//  [alertView show];
//
//}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
