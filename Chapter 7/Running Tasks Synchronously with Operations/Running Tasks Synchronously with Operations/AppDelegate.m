//
//  AppDelegate.m
//  Running Tasks Synchronously with Operations
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "CountingOperation.h"

/* 1 */
//@interface AppDelegate ()
//@property (nonatomic, strong) NSInvocationOperation *simpleOperation;
//@end

/* 2 */
//@interface AppDelegate ()
//@property (nonatomic, strong) NSBlockOperation *simpleOperation;
//@end

/* 3 */
@interface AppDelegate ()
@property (nonatomic, strong) CountingOperation *simpleOperation;
@end

@implementation AppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    self.simpleOperation = [[CountingOperation alloc]
                            initWithStartingCount:0
                            endingCount:1000];
    
    [self.simpleOperation start];
    
    NSLog(@"Main thread is here");
    
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

/* 1 */
//- (void) simpleOperationEntry:(id)paramObject{
//    
//    NSLog(@"Parameter Object = %@", paramObject);
//    NSLog(@"Main Thread = %@", [NSThread mainThread]);
//    NSLog(@"Current Thread = %@", [NSThread currentThread]);
//    
//}
//
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//    NSNumber *simpleObject = [NSNumber numberWithInteger:123];
//    
//    self.simpleOperation = [[NSInvocationOperation alloc]
//                            initWithTarget:self
//                            selector:@selector(simpleOperationEntry:)
//                            object:simpleObject];
//    
//    [self.simpleOperation start];
//    
//    self.window = [[UIWindow alloc] initWithFrame:
//                   [[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}

/* 2 */
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//    self.simpleOperation = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"Main Thread = %@", [NSThread mainThread]);
//        NSLog(@"Current Thread = %@", [NSThread currentThread]);
//        NSUInteger counter = 0;
//        for (counter = 0;
//             counter < 1000;
//             counter++){
//            NSLog(@"Count = %lu", (unsigned long)counter);
//        }
//    }];
//    
//    /* Start the operation */
//    [self.simpleOperation start];
//    
//    /* Print something out just to test if we have to wait
//     for the block to execute its code or not */
//    NSLog(@"Main thread is here");
//    
//    self.window = [[UIWindow alloc] initWithFrame:
//                   [[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}

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
