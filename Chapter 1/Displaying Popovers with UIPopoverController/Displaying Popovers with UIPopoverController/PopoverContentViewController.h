//
//  PopoverContentViewController.h
//  Displaying Popovers with UIPopoverController
//
//  Created by Vandad NP on 02/07/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopoverContentViewController : UIViewController

/* We shouldn't define this as strong. That will create a retain cycle
 between the popover controller and the content view controller since the
 popover controller retains the content view controller and the view controller will
 retain the popover controller */
@property (nonatomic, weak) UIPopoverController *myPopoverController;

@end
