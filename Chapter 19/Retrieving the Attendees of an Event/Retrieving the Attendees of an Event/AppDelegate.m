//
//  AppDelegate.m
//  Retrieving the Attendees of an Event
//
//  Created by Vandad NP on 27/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <EventKit/EventKit.h>

@implementation AppDelegate

- (void) enumerateTodayEventsInStore:(EKEventStore *)paramStore
                            calendar:(EKCalendar *)paramCalendar{
    
    /* Construct the starting date for today */
    NSDate *startDate = [NSDate date];
    
    /* The end date will be 1 day from now */
    NSTimeInterval NSOneDay = 1 * 24 * 60 * 60;
    NSDate *endDate = [startDate dateByAddingTimeInterval:NSOneDay];
    
    /* Create the predicate that we can later pass to
     the event store in order to fetch the events */
    NSPredicate *searchPredicate =
    [paramStore predicateForEventsWithStartDate:startDate
                                        endDate:endDate
                                      calendars:@[paramCalendar]];
    
    /* Make sure we succeeded in creating the predicate */
    if (searchPredicate == nil){
        NSLog(@"Could not create the search predicate.");
        return;
    }
    
    /* Fetch all the events that fall between the
     starting and the ending dates */
    NSArray *events = [paramStore eventsMatchingPredicate:searchPredicate];
    
    /* Array of NSString equivalents of the values
     in the EKParticipantRole enumeration */
    NSArray *attendeeRole = @[
                              @"Unknown",
                              @"Required",
                              @"Optional",
                              @"Chair",
                              @"Non Participant",
                              ];
    
    /* Array of NSString equivalents of the values
     in the EKParticipantStatus enumeration */
    NSArray *attendeeStatus = @[
                                @"Unknown",
                                @"Pending",
                                @"Accepted",
                                @"Declined",
                                @"Tentative",
                                @"Delegated",
                                @"Completed",
                                @"In Process",
                                ];
    
    /* Array of NSString equivalents of the values
     in the EKParticipantType enumeration */
    NSArray *attendeeType = @[
                              @"Unknown",
                              @"Person",
                              @"Room",
                              @"Resource",
                              @"Group"
                              ];
    
    /* Go through all the events and print their information
     out to the console */
    if (events != nil){
        
        NSUInteger eventCounter = 0;
        for (EKEvent *thisEvent in events){
            
            eventCounter++;
            
            NSLog(@"Event %lu Start Date = %@",
                  (unsigned long)eventCounter,
                  thisEvent.startDate);
            
            NSLog(@"Event %lu End Date = %@",
                  (unsigned long)eventCounter,
                  thisEvent.endDate);
            
            NSLog(@"Event %lu Title = %@",
                  (unsigned long)eventCounter,
                  thisEvent.title);
            
            if (thisEvent.attendees == nil ||
                [thisEvent.attendees count] == 0){
                NSLog(@"Event %lu has no attendees",
                      (unsigned long)eventCounter);
                continue;
            }
            
            NSUInteger attendeeCounter = 1;
            for (EKParticipant *participant in thisEvent.attendees){
                
                NSLog(@"Event %lu Attendee %lu Name = %@",
                      (unsigned long)eventCounter,
                      (unsigned long)attendeeCounter,
                      participant.name);
                
                NSLog(@"Event %lu Attendee %lu Role = %@",
                      (unsigned long)eventCounter,
                      (unsigned long)attendeeCounter,
                      attendeeRole[participant.participantRole]);
                
                NSLog(@"Event %lu Attendee %lu Status = %@",
                      (unsigned long)eventCounter,
                      (unsigned long)attendeeCounter,
                      attendeeStatus[participant.participantStatus]);
                
                NSLog(@"Event %lu Attendee %lu Type = %@",
                      (unsigned long)eventCounter,
                      (unsigned long)attendeeCounter,
                      attendeeType[participant.participantType]);
                
                NSLog(@"Event %lu Attendee %lu URL = %@",
                      (unsigned long)eventCounter,
                      (unsigned long)attendeeCounter,
                      participant.URL);
                
                attendeeCounter++;
                
            }
            
        }
        
    } else {
        NSLog(@"The array of events is nil.");
    }
    
}

- (void) readEventsInStore:(EKEventStore *)paramStore{
    
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
    
    [self enumerateTodayEventsInStore:paramStore calendar:calendar];
    
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
            [self readEventsInStore:eventStore];
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
                     [self readEventsInStore:eventStore];
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
