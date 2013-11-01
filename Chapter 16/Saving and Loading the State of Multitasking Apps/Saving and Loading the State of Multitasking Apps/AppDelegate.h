//
//  AppDelegate.h
//  Saving and Loading the State of Multitasking Apps
//
//  Created by Vandad NP on 29/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

/* Saving the state of our app */
- (void) saveUserScore;
- (void) saveLevelToDisk;
- (void) pauseGameEngine;

/* Loading the state of our app */
- (void) loadUserScore;
- (void) loadLevelFromDisk;
- (void) resumeGameEngine;

@end
