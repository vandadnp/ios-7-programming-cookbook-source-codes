//
//  AppDelegate.m
//  Adding Background Fetch Capabilities to Your Apps
//
//  Created by Vandad NP on 30/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsItem.h"

@implementation AppDelegate

- (NSMutableArray *) allNewsItems{
    if (_allNewsItems == nil){
        _allNewsItems = [[NSMutableArray alloc] init];
        
        /* Pre-populate the array with one item */
        NewsItem *item = [[NewsItem alloc] init];
        item.date = [NSDate date];
        item.text = [NSString stringWithFormat:@"News text 1"];
        [_allNewsItems addObject:item];
        
    }
    return _allNewsItems;
}

- (void) fetchNewsItems:(BOOL *)paramFetchedNewItems{
    
    if (arc4random_uniform(2) != 1){
        if (paramFetchedNewItems != nil){
            *paramFetchedNewItems = NO;
        }
        return;
    }
    
    [self willChangeValueForKey:@"allNewsItems"];
    
    /* Generate a new item */
    
    NewsItem *item = [[NewsItem alloc] init];
    item.date = [NSDate date];
    item.text = [NSString stringWithFormat:@"News text %lu",
                 (unsigned long)self.allNewsItems.count + 1];
    [self.allNewsItems addObject:item];
    
    if (paramFetchedNewItems != nil){
        *paramFetchedNewItems = YES;
    }
    
    [self didChangeValueForKey:@"allNewsItems"];
    
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    [application setMinimumBackgroundFetchInterval:
     UIApplicationBackgroundFetchIntervalMinimum];
    
    return YES;
}

- (void)                application:(UIApplication *)application
  performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))
    completionHandler{
    
    BOOL haveNewContent = NO;
    [self fetchNewsItems:&haveNewContent];
    
    if (haveNewContent){
        completionHandler(UIBackgroundFetchResultNewData);
    } else {
        completionHandler(UIBackgroundFetchResultNoData);
    }
    
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
