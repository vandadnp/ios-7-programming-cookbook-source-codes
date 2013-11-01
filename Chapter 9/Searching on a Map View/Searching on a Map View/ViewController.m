//
//  ViewController.m
//  Searching on a Map View
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate>
@property (nonatomic, strong) MKMapView *myMapView;
@end

@implementation ViewController

- (void)                mapView:(MKMapView *)mapView
   didFailToLocateUserWithError:(NSError *)error{
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Failed"
                              message:@"Could not get the user's location"
                              delegate:nil cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
}

- (void)        mapView:(MKMapView *)mapView
  didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"restaurants";
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    
    request.region =
    MKCoordinateRegionMake(userLocation.location.coordinate, span);
    
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    
    [search startWithCompletionHandler:
     ^(MKLocalSearchResponse *response, NSError *error) {
        
         for (MKMapItem *item in response.mapItems){
             
             NSLog(@"Item name = %@", item.name);
             NSLog(@"Item phone number = %@", item.phoneNumber);
             NSLog(@"Item url = %@", item.url);
             NSLog(@"Item location = %@", item.placemark.location);
             
         }
         
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Create a map as big as our view */
    self.myMapView = [[MKMapView alloc]
                      initWithFrame:self.view.bounds];
    
    self.myMapView.delegate = self;
    
    /* Set the map type to Standard */
    self.myMapView.mapType = MKMapTypeStandard;
    
    self.myMapView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;
    
    self.myMapView.showsUserLocation = YES;
    self.myMapView.userTrackingMode = MKUserTrackingModeFollow;
    
    /* Add it to our view */
    [self.view addSubview:self.myMapView];
    
}

@end
