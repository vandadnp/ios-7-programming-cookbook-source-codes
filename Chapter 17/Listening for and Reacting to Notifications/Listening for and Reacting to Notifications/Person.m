//
//  Person.m
//  Listening for and Reacting to Local Notifications
//
//  Created by Vandad NP on 16/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "Person.h"
#import "AppDelegate.h"

@implementation Person

- (void) handleSetPersonInfoNotification:(NSNotification *)paramNotification{
    
    self.firstName = paramNotification.userInfo[kSetPersonInfoKeyFirstName];
    self.lastName = paramNotification.userInfo[kSetPersonInfoKeyLastName];
    
}

- (instancetype) init{
    self = [super init];
    if (self != nil){
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        
        [center addObserver:self
                   selector:@selector(handleSetPersonInfoNotification:)
                       name:kSetPersonInfoNotification
                     object:[[UIApplication sharedApplication] delegate]];
        
    }
    return self;
}

- (void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
