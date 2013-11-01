//
//  AppDelegate.m
//  Scheduling Local Notifications
//
//  Created by Vandad NP on 16/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void) scheduleLocalNotification{
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    /* Time and timezone settings */
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:8.0];
    notification.timeZone = [[NSCalendar currentCalendar] timeZone];
    
    notification.alertBody =
        NSLocalizedString(@"A new item is downloaded.", nil);
    
    /* Action settings */
    notification.hasAction = YES;
    notification.alertAction = NSLocalizedString(@"View", nil);
    
    /* Badge settings */
    notification.applicationIconBadgeNumber =
        [UIApplication sharedApplication].applicationIconBadgeNumber + 1;
    
    /* Additional information, user info */
    notification.userInfo = @{@"Key 1": @"Value 1",
                              @"Key 2" : @"Value 2"};
    
    /* Schedule the notification */
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey] != nil){
        UILocalNotification *notification =
        launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
        [self application:application didReceiveLocalNotification:notification];
    } else {
        [self scheduleLocalNotification];
    }
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)            application:(UIApplication *)application
    didReceiveLocalNotification:(UILocalNotification *)notification{
    
    NSString *key1Value = notification.userInfo[@"Key 1"];
    NSString *key2Value = notification.userInfo[@"Key 2"];
    
    if ([key1Value length] > 0 &&
        [key2Value length] > 0){
        
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:nil
                                   message:@"Handling the local notification"
                                  delegate:nil
                         cancelButtonTitle:@"OK"
                         otherButtonTitles:nil];
        [alert show];
        
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
