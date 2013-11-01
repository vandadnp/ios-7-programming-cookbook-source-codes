//
//  ViewController.m
//  Presenting Event View Controllers
//
//  Created by Vandad NP on 27/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface ViewController () <EKEventViewDelegate>
@property (nonatomic, strong) EKEventStore *eventStore;
@end

@implementation ViewController

- (void)eventViewController:(EKEventViewController *)controller
      didCompleteWithAction:(EKEventViewAction)action{
    
    switch (action){
            
        case EKEventViewActionDeleted:{
            NSLog(@"User deleted the event.");
            break;
        }
        case EKEventViewActionDone:{
            NSLog(@"User finished viewing the event.");
            break;
        }
        case EKEventViewActionResponded:{
            NSLog(@"User responsed to the invitation in the event.");
            break;
        }
            
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
//- (void) displayEventViewController{
//    
//    EKSource *icloudSource = [self sourceInEventStore:self.eventStore
//                                           sourceType:EKSourceTypeCalDAV
//                                          sourceTitle:@"iCloud"];
//    
//    if (icloudSource == nil){
//        NSLog(@"You have not configured iCloud for your device.");
//        return;
//    }
//    
//    NSSet *calendars = [icloudSource
//                        calendarsForEntityType:EKEntityTypeEvent];
//    
//    NSTimeInterval NSOneYear = 1 * 365 * 24.0f * 60.0f * 60.0f;
//    NSDate *startDate = [[NSDate date] dateByAddingTimeInterval:-NSOneYear];
//    NSDate *endDate = [NSDate date];
//    
//    NSPredicate *predicate =
//    [self.eventStore predicateForEventsWithStartDate:startDate
//                                             endDate:endDate
//                                           calendars:calendars.allObjects];
//    
//    NSArray *events = [self.eventStore eventsMatchingPredicate:predicate];
//    
//    if ([events count] > 0){
//        EKEvent *event = events[0];
//        EKEventViewController *controller = [[EKEventViewController alloc] init];
//        controller.event = event;
//        controller.allowsEditing = NO;
//        controller.allowsCalendarPreview = YES;
//        controller.delegate = self;
//        
//        [self.navigationController pushViewController:controller
//                                             animated:YES];
//    }
//
//    
//}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    static BOOL beenHereBefore = NO;
    
    if (beenHereBefore){
        return;
    } else {
        beenHereBefore = YES;
    }
    
    self.eventStore = [[EKEventStore alloc] init];
    
    switch ([EKEventStore
             authorizationStatusForEntityType:EKEntityTypeEvent]){
            
        case EKAuthorizationStatusAuthorized:{
            [self displayEventViewController];
            break;
        }
        case EKAuthorizationStatusDenied:{
            [self displayAccessDenied];
            break;
        }
        case EKAuthorizationStatusNotDetermined:{
            [self.eventStore
             requestAccessToEntityType:EKEntityTypeEvent
             completion:^(BOOL granted, NSError *error) {
                 if (granted){
                     [self displayEventViewController];
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
    
}

- (void) displayEventViewController{
    
    EKSource *icloudSource = [self sourceInEventStore:self.eventStore
                                           sourceType:EKSourceTypeCalDAV
                                          sourceTitle:@"iCloud"];
    
    if (icloudSource == nil){
        NSLog(@"You have not configured iCloud for your device.");
        return;
    }
    
    NSSet *calendars = [icloudSource
                        calendarsForEntityType:EKEntityTypeEvent];
    
    NSTimeInterval NSOneYear = 1 * 365 * 24.0f * 60.0f * 60.0f;
    NSDate *startDate = [[NSDate date] dateByAddingTimeInterval:-NSOneYear];
    NSDate *endDate = [NSDate date];
    
    NSPredicate *predicate =
    [self.eventStore predicateForEventsWithStartDate:startDate
                                             endDate:endDate
                                           calendars:calendars.allObjects];
    
    NSArray *events = [self.eventStore eventsMatchingPredicate:predicate];
    
    if ([events count] > 0){
        EKEvent *event = events[0];
        EKEventViewController *controller = [[EKEventViewController alloc] init];
        controller.event = event;
        controller.allowsEditing = YES;
        controller.allowsCalendarPreview = YES;
        controller.delegate = self;
        
        self.navigationItem.backBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Go Back"
                                         style:UIBarButtonItemStylePlain
                                        target:nil
                                        action:nil];
        
        [self.navigationController pushViewController:controller
                                             animated:YES];
    }

}

@end
