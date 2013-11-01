//
//  AppDelegate.m
//  Adding Recurring Events to Calendars
//
//  Created by Vandad NP on 27/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <EventKit/EventKit.h>

@implementation AppDelegate

- (BOOL) createRecurringEventInStore:(EKEventStore *)paramStore
                          inCalendar:(EKCalendar *)paramCalendar{
        
    /* Create an event */
    EKEvent *event = [EKEvent eventWithEventStore:paramStore];
    
    /* Create an event that happens today and happens
     every month for a year from now */
    
    NSDate *eventStartDate = [NSDate date];
    
    /* The event's end date is one hour from the moment it is created */
    NSTimeInterval NSOneHour = 1 * 60 * 60;
    NSDate *eventEndDate = [eventStartDate dateByAddingTimeInterval:NSOneHour];
    
    /* Assign the required properties, especially
     the target calendar */
    event.calendar = paramCalendar;
    event.title = @"My Event";
    event.startDate = eventStartDate;
    event.endDate = eventEndDate;
    
    /* The end date of the recurring rule
     is one year from now */
    NSTimeInterval NSOneYear = 365 * 24 * 60 * 60;
    NSDate *oneYearFromNow = [eventStartDate
                              dateByAddingTimeInterval:NSOneYear];
    
    /* Create an Event Kit date from this date */
    EKRecurrenceEnd *recurringEnd =
    [EKRecurrenceEnd recurrenceEndWithEndDate:oneYearFromNow];
    
    /* And the recurring rule. This event happens every
     month (EKRecurrenceFrequencyMonthly), once a month (interval:1)
     and the recurring rule ends a year from now (end:RecurringEnd) */
    
    EKRecurrenceRule *recurringRule =
    [[EKRecurrenceRule alloc]
     initRecurrenceWithFrequency:EKRecurrenceFrequencyMonthly
     interval:1
     end:recurringEnd];
    
    /* Set the recurring rule for the event */
    event.recurrenceRules = @[recurringRule];
    
    NSError *saveError = nil;
    
    /* Save the event */
    if ([paramStore saveEvent:event
                         span:EKSpanFutureEvents
                        error:&saveError]){
        NSLog(@"Successfully created the recurring event.");
        return YES;
    } else {
        NSLog(@"Failed to create the recurring event %@", saveError);
    }
    return NO;
    
}

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

- (void) insertEventIntoStore:(EKEventStore *)paramStore{
    
    EKSource *icloudSource = [self sourceInEventStore:paramStore
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
    
    /* Create the new event */
    BOOL createdSuccessfully = [self createRecurringEventInStore:paramStore
                                                      inCalendar:calendar];
    
    if (createdSuccessfully){
        NSLog(@"Successfully created the event.");
    } else {
        NSLog(@"Failed to create the event.");
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
            [self insertEventIntoStore:eventStore];
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
                     [self insertEventIntoStore:eventStore];
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
