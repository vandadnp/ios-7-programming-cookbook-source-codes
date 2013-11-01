//
//  AppDelegate.m
//  Accessing the Contents of Calendars
//
//  Created by Vandad NP on 27/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <EventKit/EventKit.h>

@implementation AppDelegate

- (EKSource *) sourceInEventStore:(EKEventStore *)paramEventStore
                       sourceType:(EKSourceType)paramType
                      sourceTitle:(NSString *)paramSourceTitle{
    
    for (EKSource *source in paramEventStore.sources){
        
        if (source.sourceType == paramType &&
            [source.title
             caseInsensitiveCompare:paramSourceTitle] == NSOrderedSame){
                return source;
            }
    }
    return nil;
    
}

- (EKCalendar *) calendarWithTitle:(NSString *)paramTitle
                              type:(EKCalendarType)paramType
                          inSource:(EKSource *)paramSource
                      forEventType:(EKEntityType)paramEventType{
    
    for (EKCalendar *calendar in [paramSource
                                  calendarsForEntityType:paramEventType]){
        if ([calendar.title
             caseInsensitiveCompare:paramTitle] == NSOrderedSame &&
            calendar.type == paramType){
            return calendar;
        }
    }
    
    return nil;
    
}

- (void) readEvents{
    
    /* Instantiate the event store */
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    EKSource *icloudSource = [self sourceInEventStore:eventStore
                                           sourceType:EKSourceTypeCalDAV
                                          sourceTitle:@"iCloud"];
    
    if (icloudSource == nil){
        NSLog(@"You have not configured iCloud for your device.");
        return;
    }
    
    EKCalendar *calendar = [self calendarWithTitle:@"Calendar"
                                              type:EKCalendarTypeCalDAV
                                          inSource:icloudSource
                                      forEventType:EKEntityTypeEvent];
    
    if (calendar == nil){
        NSLog(@"Could not find the calendar we were looking for.");
        return;
    }
    
    /* The start date will be today */
    NSDate *startDate = [NSDate date];
    
    /* The end date will be 1 day from today */
    NSDate *endDate = [startDate dateByAddingTimeInterval:24 * 60 * 60];
    
    /* Create the predicate that we can later pass to the
     event store in order to fetch the events */
    NSPredicate *searchPredicate =
    [eventStore predicateForEventsWithStartDate:startDate
                                        endDate:endDate
                                      calendars:@[calendar]];
    
    /* Make sure we succeeded in creating the predicate */
    if (searchPredicate == nil){
        NSLog(@"Could not create the search predicate.");
        return;
    }
    
    /* Fetch all the events that fall between
     the starting and the ending dates */
    NSArray *events = [eventStore eventsMatchingPredicate:searchPredicate];
    
    /* Go through all the events and print their information
     out to the console */
    if (events != nil){
        
        NSUInteger counter = 1;
        for (EKEvent *event in events){
            
            NSLog(@"Event %lu Start Date = %@",
                  (unsigned long)counter,
                  event.startDate);
            
            NSLog(@"Event %lu End Date = %@",
                  (unsigned long)counter,
                  event.endDate);
            
            NSLog(@"Event %lu Title = %@",
                  (unsigned long)counter,
                  event.title);
            
            counter++;
        }
        
    } else {
        NSLog(@"The array of events for this start/end time is nil.");
    }
    
}

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

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    switch ([EKEventStore
             authorizationStatusForEntityType:EKEntityTypeEvent]){
            
        case EKAuthorizationStatusAuthorized:{
            [self readEvents];
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
                     [self readEvents];
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
