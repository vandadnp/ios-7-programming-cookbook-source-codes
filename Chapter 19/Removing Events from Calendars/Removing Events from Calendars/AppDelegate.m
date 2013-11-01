//
//  AppDelegate.m
//  Removing Events from Calendars
//
//  Created by Vandad NP on 27/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <EventKit/EventKit.h>

@implementation AppDelegate

- (BOOL)    removeEventWithTitle:(NSString *)paramTitle
                       startDate:(NSDate *)paramStartDate
                         endDate:(NSDate *)paramEndDate
                    inEventStore:(EKEventStore *)paramEventStore
                      inCalendar:(EKCalendar *)paramCalendar
                           notes:(NSString *)paramNotes{
    
    BOOL result = NO;
    
    /* If a calendar does not allow modification of its contents
     then we cannot insert an event into it */
    if (paramCalendar.allowsContentModifications == NO){
        NSLog(@"The selected calendar does not allow modifications.");
        return NO;
    }
    
    
    NSPredicate *predicate =
    [paramEventStore predicateForEventsWithStartDate:paramStartDate
                                             endDate:paramEndDate
                                           calendars:@[paramCalendar]];
    
    /* Get all the events that match the parameters */
    NSArray *events = [paramEventStore eventsMatchingPredicate:predicate];
    
    if ([events count] > 0){
        
        /* Delete them all */
        for (EKEvent *event in events){
            NSError *removeError = nil;
            /* Do not commit here, we will commit in batch after we have
             removed all the events that matched our criteria */
            if ([paramEventStore removeEvent:event
                                        span:EKSpanThisEvent
                                      commit:NO
                                       error:&removeError] == NO){
                NSLog(@"Failed to remove event %@ with error = %@",
                      event,
                      removeError);
            }
        }
        
        NSError *commitError = nil;
        if ([paramEventStore commit:&commitError]){
            result = YES;
        } else {
            NSLog(@"Failed to commit the event store.");
        }
        
    } else {
        NSLog(@"No events matched your input.");
    }
    
    return result;
    
}

- (BOOL)    createEventWithTitle:(NSString *)paramTitle
                       startDate:(NSDate *)paramStartDate
                         endDate:(NSDate *)paramEndDate
                      inCalendar:(EKCalendar *)paramCalendar
                    inEventStore:(EKEventStore *)paramStore
                           notes:(NSString *)paramNotes{
    
    BOOL result = NO;
    
    /* If a calendar does not allow modification of its contents
     then we cannot insert an event into it */
    if (paramCalendar.allowsContentModifications == NO){
        NSLog(@"The selected calendar does not allow modifications.");
        return NO;
    }
    
    /* Create an event */
    EKEvent *event = [EKEvent eventWithEventStore:paramStore];
    event.calendar = paramCalendar;
    
    /* Set the properties of the event such as its title,
     start date/time, end date/time, etc. */
    event.title = paramTitle;
    event.notes = paramNotes;
    event.startDate = paramStartDate;
    event.endDate = paramEndDate;
    
    /* Finally, save the event into the calendar */
    NSError *saveError = nil;
    
    result = [paramStore saveEvent:event
                              span:EKSpanThisEvent
                             error:&saveError];
    
    if (result == NO){
        NSLog(@"An error occurred = %@", saveError);
    }
    
    return result;
    
}

- (void) insertEventIntoStore:(EKEventStore *)paramStore
                    startDate:(NSDate *)paramStartDate
                      endDate:(NSDate *)paramEndDate{
    
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
    BOOL createdSuccessfully = [self createEventWithTitle:@"My Concert"
                                                startDate:paramStartDate
                                                  endDate:paramEndDate
                                               inCalendar:calendar
                                             inEventStore:paramStore
                                                    notes:nil];
    
    if (createdSuccessfully){
        NSLog(@"Successfully created the event.");
    } else {
        NSLog(@"Failed to create the event.");
    }
    
}

- (void) deleteEventInStore:(EKEventStore *)paramEventStore{
    
    EKSource *icloudSource = [self sourceInEventStore:paramEventStore
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
    
    /* Create the event first */
    /* The event starts from today, right now */
    NSDate *startDate = [NSDate date];
    
    /* And the event ends this time tomorrow.
     24 hours, 60 minutes per hour and 60 seconds per minute
     hence 24 * 60 * 60 */
    NSDate *endDate = [startDate
                       dateByAddingTimeInterval:24 * 60 * 60];
    
    NSString *eventTitle = @"My Event";
    
    BOOL createdSuccessfully = [self createEventWithTitle:eventTitle
                                                startDate:startDate
                                                  endDate:endDate
                                               inCalendar:calendar
                                             inEventStore:paramEventStore
                                                    notes:nil];
    
    if (createdSuccessfully == NO){
        NSLog(@"Could not create the event.");
    }
    
    BOOL removedSuccessfully = [self removeEventWithTitle:eventTitle
                                                startDate:startDate
                                                  endDate:endDate
                                             inEventStore:paramEventStore
                                               inCalendar:calendar
                                                    notes:nil];
    
    if (removedSuccessfully){
        NSLog(@"Successfully created and deleted the event");
    } else {
        NSLog(@"Failed to delete the event.");
    }
        
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
            [self deleteEventInStore:eventStore];
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
                     [self deleteEventInStore:eventStore];
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
