//
//  AppDelegate.m
//  Saving and Loading the State of Multitasking Apps
//
//  Created by Vandad NP on 29/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void) saveUserScore{
    /* Save the user score here */
}

- (void) saveLevelToDisk{
    /* Save the current level and the user's location on map to disk */
}

- (void) pauseGameEngine{
    /* Pause the game engine here */
}

- (void) loadUserScore{
    /* Load the user's location back to memory */
}

- (void) loadLevelFromDisk{
    /* Load the user's previous location on the map */
}

- (void) resumeGameEngine{
    /* Resume the game engine here */
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application{
    [self pauseGameEngine];
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
    [self resumeGameEngine];
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    [self saveUserScore];
    [self saveLevelToDisk];
    [self pauseGameEngine];
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
    [self loadUserScore];
    [self loadLevelFromDisk];
    [self resumeGameEngine];
}

@end
