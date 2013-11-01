//
//  AppDelegate.m
//  Retrieving Calendar Groups on an iOS Device
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


/* 1 */
//- (void) findIcloudEventSource{
//    
//    EKSource *icloudEventSource = nil;
//    
//    EKEventStore *eventStore = [[EKEventStore alloc] init];
//    for (EKSource *source in eventStore.sources){
//        
//        if (source.sourceType == EKSourceTypeCalDAV &&
//            [source.title caseInsensitiveCompare:@"iCloud"]){
//            icloudEventSource = source;
//            break;
//        }
//    }
//    
//    if (icloudEventSource != nil){
//        NSLog(@"The iCloud event source was found = %@", icloudEventSource);
//    } else {
//        NSLog(@"Could not find the iCloud event source");
//    }
//    
//}

/* 2 */
- (void) findIcloudEventSource{
    
    EKSource *icloudEventSource = nil;
    
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    for (EKSource *source in eventStore.sources){
        
        if (source.sourceType == EKSourceTypeCalDAV &&
            [source.title caseInsensitiveCompare:@"iCloud"]){
            icloudEventSource = source;
            break;
        }
    }
    
    if (icloudEventSource != nil){
        NSLog(@"The iCloud event source was found = %@", icloudEventSource);
        
        NSSet *calendars = [icloudEventSource
                              calendarsForEntityType:EKEntityTypeEvent];
        
        for (EKCalendar *calendar in calendars){
            NSLog(@"Calendar = %@", calendar);
        }
        
    } else {
        NSLog(@"Could not find the iCloud event source");
    }
    
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    switch ([EKEventStore
             authorizationStatusForEntityType:EKEntityTypeEvent]){
            
        case EKAuthorizationStatusAuthorized:{
            [self findIcloudEventSource];
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
                     [self findIcloudEventSource];
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
