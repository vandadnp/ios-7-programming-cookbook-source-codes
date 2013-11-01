//
//  ViewController.m
//  Presenting Event Edit View Controllers
//
//  Created by Vandad NP on 27/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <EventKitUI/EventKitUI.h>
#import <EventKit/EventKit.h>

@interface ViewController () <EKEventEditViewDelegate>
@property (nonatomic, strong) EKEventStore *eventStore;
@end

@implementation ViewController

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

- (void)eventEditViewController:(EKEventEditViewController *)controller
          didCompleteWithAction:(EKEventEditViewAction)action{
    
    switch (action){
            
        case EKEventEditViewActionCanceled:{
            NSLog(@"Cancelled");
            break;
        }
        case EKEventEditViewActionSaved:{
            NSLog(@"Saved");
            break;
        }
        case EKEventEditViewActionDeleted:{
            NSLog(@"Deleted");
            break;
        }
            
    }
    
    [self.navigationController dismissViewControllerAnimated:YES
                                                  completion:nil];
    
}

- (void) displayEventEditController{
    
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
        
        EKEventEditViewController *controller =
        [[EKEventEditViewController alloc] init];
        
        controller.event = event;
        controller.editViewDelegate = self;
        
        [self.navigationController presentViewController:controller
                                                animated:YES
                                              completion:nil];
        
    }
    
}

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
            [self displayEventEditController];
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
                     [self displayEventEditController];
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


@end
