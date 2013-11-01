//
//  AppDelegate.h
//  Listening for and Reacting to Notifications
//
//  Created by Vandad NP on 16/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

/* The name of the notification that we are going to send */
extern NSString *const kSetPersonInfoNotification;
/* The first-name key in the user-info dictionary of our notification */
extern NSString *const kSetPersonInfoKeyFirstName;
/* The last-name key in the user-info dictionary of our notification */
extern NSString *const kSetPersonInfoKeyLastName;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@end
