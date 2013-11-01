//
//  ViewController.m
//  Listening for and Reacting to Keyboard Notifications
//
//  Created by Vandad NP on 16/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (BOOL) textFieldShouldReturn:(UITextField *)paramTextField{
    [paramTextField resignFirstResponder];
    
    return YES;
}

- (void) handleKeyboardWillShow:(NSNotification *)paramNotification{
    
    NSDictionary *userInfo = paramNotification.userInfo;
    
    /* Get the duration of the animation of the keyboard for when it
     gets displayed on the screen. We will animate our contents using
     the same animation duration */
    NSValue *animationDurationObject =
        userInfo[UIKeyboardAnimationDurationUserInfoKey];
    
    NSValue *keyboardEndRectObject = userInfo[UIKeyboardFrameEndUserInfoKey];
    
    double animationDuration = 0.0;
    CGRect keyboardEndRect = CGRectMake(0.0f, 0.0f, 0.0f, 0.0f);
    
    [animationDurationObject getValue:&animationDuration];
    [keyboardEndRectObject getValue:&keyboardEndRect];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    /* Convert the frame from window's coordinate system to
     our view's coordinate system */
    keyboardEndRect = [self.view convertRect:keyboardEndRect
                                    fromView:window];
    
    /* Find out how much of our view is being covered by the keyboard */
    CGRect intersectionOfKeyboardRectAndWindowRect =
        CGRectIntersection(self.view.frame, keyboardEndRect);
    
    /* Scroll the scroll view up to show the full contents of our view */
    [UIView animateWithDuration:animationDuration animations:^{
        
        self.scrollView.contentInset =
        UIEdgeInsetsMake(0.0f,
                         0.0f,
                         intersectionOfKeyboardRectAndWindowRect.size.height,
                         0.0f);
        
        [self.scrollView scrollRectToVisible:self.textField.frame animated:NO];

    }];
    
}

- (void) handleKeyboardWillHide:(NSNotification *)paramSender{
    
    NSDictionary *userInfo = [paramSender userInfo];
    
    NSValue *animationDurationObject =
        [userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    double animationDuration = 0.0;
    
    [animationDurationObject getValue:&animationDuration];
    
    [UIView animateWithDuration:animationDuration animations:^{
        self.scrollView.contentInset = UIEdgeInsetsZero;
    }];
    
}

- (void) viewWillAppear:(BOOL)paramAnimated{
    [super viewWillAppear:paramAnimated];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(handleKeyboardWillShow:)
                   name:UIKeyboardWillShowNotification object:nil];
    
    [center addObserver:self selector:@selector(handleKeyboardWillHide:)
                   name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)paramAnimated{
    [super viewWillDisappear:paramAnimated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
