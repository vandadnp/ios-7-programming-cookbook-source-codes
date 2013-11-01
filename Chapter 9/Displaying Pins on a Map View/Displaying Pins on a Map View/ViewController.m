//
//  ViewController.m
//  Displaying Pins on a Map View
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import "MyAnnotation.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate>
@property (nonatomic, strong) MKMapView *myMapView;
@end

@implementation ViewController

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
    
    /* Add it to our view */
    [self.view addSubview:self.myMapView];
    
    /* This is just a sample location */
    CLLocationCoordinate2D location =
    CLLocationCoordinate2DMake(50.82191692907181, -0.13811767101287842);
    
    /* Create the annotation using the location */
    MyAnnotation *annotation =
    [[MyAnnotation alloc] initWithCoordinates:location
                                        title:@"My Title"
                                     subTitle:@"My Sub Title"];
    
    /* And eventually add it to the map */
    [self.myMapView addAnnotation:annotation];
    
}

@end
