//
//  AppDelegate.m
//  Displaying Directions on The Map
//
//  Created by Vandad NP on 03/07/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@implementation AppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{

    NSString *destination = @"Churchill Square Shopping Center, \
    Brighton, United Kingdom";
    
    [[CLGeocoder new]
     geocodeAddressString:destination
     completionHandler:^(NSArray *placemarks, NSError *error) {
         
         if (error != nil){
             /* Handle the error here perhaps by displaying an alert */
             return;
         }
         
         MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
         request.source = [MKMapItem mapItemForCurrentLocation];
         
         /* Convert the CoreLocation destination 
          placemark to a MapKit placemark */
         /* Get the placemark of the destination address */
         CLPlacemark *placemark = placemarks[0];
         CLLocationCoordinate2D destinationCoordinates =
         placemark.location.coordinate;
         MKPlacemark *destination = [[MKPlacemark alloc]
                                     initWithCoordinate:destinationCoordinates
                                     addressDictionary:nil];
         
         request.destination = [[MKMapItem alloc]
                                initWithPlacemark:destination];
         
         /* Set the transportation method to automobile */
         request.transportType = MKDirectionsTransportTypeAutomobile;
         
         /* Get the directions */
         MKDirections *directions = [[MKDirections alloc]
                                     initWithRequest:request];
         [directions calculateDirectionsWithCompletionHandler:
          ^(MKDirectionsResponse *response, NSError *error) {
              
              /* You can manually parse the response but in here we will take
               a shortcut and use the Maps app to display our source and
               destination. We didn't have to make this API call at all
               as we already had the map items before but this is to
               demonstrate that the directions response contains more
               information than just the source and the destination */
              
              /* Display the directions on the Maps app */
              [MKMapItem
               openMapsWithItems:@[response.source, response.destination]
               launchOptions:@{
                               MKLaunchOptionsDirectionsModeKey :
                                   MKLaunchOptionsDirectionsModeDriving}];
          }];
         
     }];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
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
