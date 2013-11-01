//
//  PopoverContentViewController.m
//  Displaying Popovers with UIPopoverController
//
//  Created by Vandad NP on 02/07/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "PopoverContentViewController.h"

@interface PopoverContentViewController ()
@property (nonatomic, strong) UIButton *buttonPhoto;
@property (nonatomic, strong) UIButton *buttonAudio;
@end

@implementation PopoverContentViewController

- (BOOL) isInPopover{
    
    Class popoverClass = NSClassFromString(@"UIPopoverController");
    
    if (popoverClass != nil &&
        UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad &&
        self.myPopoverController != nil){
        return YES;
    } else {
        return NO;
    }
    
}

- (void) gotoAppleWebsite:(id)paramSender{
    
    if ([self isInPopover]){
        /* Go to website and then dismiss popover */
        [self.myPopoverController dismissPopoverAnimated:YES];
    } else {
        /* Handle case for iPhone */
    }
    
}

- (void) gotoAppleStoreWebsite:(id)paramSender{
    
    if ([self isInPopover]){
        /* Go to website and then dismiss popover */
        [self.myPopoverController dismissPopoverAnimated:YES];
    } else {
        /* Handle case for iPhone */
    }
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.preferredContentSize = CGSizeMake(200.0f, 125.0f);
    
    CGRect buttonRect = CGRectMake(20.0f,
                                   20.0f,
                                   160.0f,
                                   37.0f);
    
    self.buttonPhoto = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.buttonPhoto setTitle:@"Photo"
                      forState:UIControlStateNormal];
    [self.buttonPhoto addTarget:self
                         action:@selector(gotoAppleWebsite:)
               forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonPhoto.frame = buttonRect;
    
    [self.view addSubview:self.buttonPhoto];
    
    
    buttonRect.origin.y += 50.0f;
    self.buttonAudio = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.buttonAudio setTitle:@"Audio"
                      forState:UIControlStateNormal];
    [self.buttonAudio addTarget:self
                         action:@selector(gotoAppleStoreWebsite:)
               forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonAudio.frame = buttonRect;
    
    [self.view addSubview:self.buttonAudio];
    
}

@end
