//
//  AppDelegate.m
//  Handling Location Changes in the Background
//
//  Created by Vandad NP on 29/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate () <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *myLocationManager;
@property (nonatomic, unsafe_unretained, getter=isExecutingInBackground)
BOOL executingInBackground;
@end

@implementation AppDelegate

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    
    if ([self isExecutingInBackground]){
        /* We are in the background. Do not do any heavy processing */
    } else {
        /* We are in the foreground. Do any processing that you wish */
    }
    
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    self.myLocationManager = [[CLLocationManager alloc] init];
    self.myLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.myLocationManager.delegate = self;
    [self.myLocationManager startUpdatingLocation];
    
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    self.executingInBackground = YES;
    
    /* Reduce the accuracy to ease the strain on
     iOS while we are in the background */
    self.myLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
    self.executingInBackground = NO;
    
    /* Now that our app is in the foreground again, let's increase the location
     detection accuracy */
    self.myLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
}

@end
