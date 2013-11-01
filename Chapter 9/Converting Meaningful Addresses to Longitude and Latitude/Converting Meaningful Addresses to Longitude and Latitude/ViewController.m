//
//  ViewController.m
//  Converting Meaningful Addresses to Longitude and Latitude
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
@property (nonatomic, strong) CLGeocoder *myGeocoder;
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    /* We have our address */
    NSString *oreillyAddress =
        @"1005 Gravenstein Highway North, Sebastopol, CA 95472, USA";
    
    self.myGeocoder = [[CLGeocoder alloc] init];
    
    [self.myGeocoder
     geocodeAddressString:oreillyAddress
     completionHandler:^(NSArray *placemarks, NSError *error) {
         
         if (placemarks.count > 0 && error == nil){
             
             NSLog(@"Found %lu placemark(s).",
                   (unsigned long)[placemarks count]);
             
             CLPlacemark *firstPlacemark = placemarks[0];
             
             NSLog(@"Longitude = %f",
                   firstPlacemark.location.coordinate.longitude);
             NSLog(@"Latitude = %f",
                   firstPlacemark.location.coordinate.latitude);
         }
         else if (placemarks.count == 0 &&
                  error == nil){
             NSLog(@"Found no placemarks.");
         }
         else if (error != nil){
             NSLog(@"An error occurred = %@", error);
         }
         
     }];
    
}

@end
