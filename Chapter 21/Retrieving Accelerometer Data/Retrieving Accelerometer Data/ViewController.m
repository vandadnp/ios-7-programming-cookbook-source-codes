//
//  ViewController.m
//  Retrieving Accelerometer Data
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
@property (nonatomic, strong) CMMotionManager *motionManager;
@end

@implementation ViewController

typedef void (^CMAccelerometerHandler)(
                                       CMAccelerometerData *accelerometerData,
                                       NSError *error);

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.motionManager = [[CMMotionManager alloc] init];
    
    if ([self.motionManager isAccelerometerAvailable]){
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [self.motionManager
         startAccelerometerUpdatesToQueue:queue
         withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
             NSLog(@"X = %.04f, Y = %.04f, Z = %.04f",
                   accelerometerData.acceleration.x,
                   accelerometerData.acceleration.y,
                   accelerometerData.acceleration.z);
         }];
    } else {
        NSLog(@"Accelerometer is not available.");
    }
    
}

@end
