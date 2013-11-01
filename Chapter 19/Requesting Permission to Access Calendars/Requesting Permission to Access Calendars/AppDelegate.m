//
//  AppDelegate.m
//  Requesting Permission to Access Calendars
//
//  Created by Vandad NP on 26/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <EventKit/EventKit.h>

@implementation AppDelegate

- (void) displayMessage:(NSString *)paramMessage{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:paramMessage
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (void) displayAccessDenied{
    [self displayMessage:@"Access to the event store is denied."];
}

- (void) displayAccessRestricted{
    [self displayMessage:@"Access to the event store is restricted."];
}

- (void) extractEventEntityCalendarsOutOfStore:(EKEventStore *)paramStore{
    
    NSArray *calendarTypes = @[
                               @"Local",
                               @"CalDAV",
                               @"Exchange",
                               @"Subscription",
                               @"Birthday",
                               ];
    
    NSArray *calendars = [paramStore
                          calendarsForEntityType:EKEntityTypeEvent];
    
    NSUInteger counter = 1;
    for (EKCalendar *calendar in calendars){
        /* The title of the calendar */
        NSLog(@"Calendar %lu Title = %@",
              (unsigned long)counter, calendar.title);
        
        /* The type of the calendar */
        NSLog(@"Calendar %lu Type = %@",
              (unsigned long)counter,
              calendarTypes[calendar.type]);
        
        /* The color that is associated with the calendar */
        NSLog(@"Calendar %lu Color = %@",
              (unsigned long)counter,
              [UIColor colorWithCGColor:calendar.CGColor]);
        
        /* And whether the calendar can be modified or not */
        if ([calendar allowsContentModifications]){
            NSLog(@"Calendar %lu can be modified.",
                  (unsigned long)counter);
        } else {
            NSLog(@"Calendar %lu cannot be modified.",
                  (unsigned long)counter);
        }
        counter++;
    }
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    switch ([EKEventStore
             authorizationStatusForEntityType:EKEntityTypeEvent]){
            
        case EKAuthorizationStatusAuthorized:{
            [self extractEventEntityCalendarsOutOfStore:eventStore];
            break;
        }
        case EKAuthorizationStatusDenied:{
            [self displayAccessDenied];
            break;
        }
        case EKAuthorizationStatusNotDetermined:{
            [eventStore
             requestAccessToEntityType:EKEntityTypeEvent
             completion:^(BOOL granted, NSError *error) {
                 if (granted){
                     [self extractEventEntityCalendarsOutOfStore:eventStore];
                 } else {
                     [self displayAccessDenied];
                 }
             }];
            break;
        }
        case EKAuthorizationStatusRestricted:{
            [self displayAccessRestricted];
            break;
        }
            
    }
    
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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
