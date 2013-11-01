//
//  ViewController.m
//  Converting Longitude and Latitude to a Meaningful Address
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
    
    CLLocation *location = [[CLLocation alloc]
                            initWithLatitude:+38.4112810
                            longitude:-122.8409780f];
    
    self.myGeocoder = [[CLGeocoder alloc] init];
    
    [self.myGeocoder
     reverseGeocodeLocation:location
     completionHandler:^(NSArray *placemarks, NSError *error) {
         
         if (error == nil && placemarks.count > 0){
             CLPlacemark *placemark = placemarks[0];
             /* We received the results */
             NSLog(@"Country = %@", placemark.country);
             NSLog(@"Postal Code = %@", placemark.postalCode);
             NSLog(@"Locality = %@", placemark.locality);
         }
         else if (error == nil && placemarks.count == 0){
             NSLog(@"No results were returned.");
         }
         else if (error != nil){
             NSLog(@"An error occurred = %@", error);
         }
         
     }];
}

@end
