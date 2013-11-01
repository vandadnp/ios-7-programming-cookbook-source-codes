//
//  AppDelegate.m
//  Running Tasks Asynchronously with Operations
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "SimpleOperation.h"

/* 2  */
@interface AppDelegate ()
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) SimpleOperation *firstOperation;
@property (nonatomic, strong) SimpleOperation *secondOperation;
@end

@implementation AppDelegate

/* 1 */
//@interface AppDelegate ()
//@property (nonatomic, strong) NSOperationQueue *operationQueue;
//@property (nonatomic, strong) NSInvocationOperation *firstOperation;
//@property (nonatomic, strong) NSInvocationOperation *secondOperation;
//@end



/* 1 */
//- (void) firstOperationEntry:(id)paramObject{
//    
//    NSLog(@"%s", __FUNCTION__);
//    NSLog(@"Parameter Object = %@", paramObject);
//    NSLog(@"Main Thread = %@", [NSThread mainThread]);
//    NSLog(@"Current Thread = %@", [NSThread currentThread]);
//    
//}
//
//- (void) secondOperationEntry:(id)paramObject{
//    
//    NSLog(@"%s", __FUNCTION__);
//    NSLog(@"Parameter Object = %@", paramObject);
//    NSLog(@"Main Thread = %@", [NSThread mainThread]);
//    NSLog(@"Current Thread = %@", [NSThread currentThread]);
//    
//}
//
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//    NSNumber *firstNumber = @111;
//    NSNumber *secondNumber = @222;
//    
//    self.firstOperation =[[NSInvocationOperation alloc]
//                          initWithTarget:self
//                          selector:@selector(firstOperationEntry:)
//                          object:firstNumber];
//    
//    self.secondOperation = [[NSInvocationOperation alloc]
//                            initWithTarget:self
//                            selector:@selector(secondOperationEntry:)
//                            object:secondNumber];
//    
//    self.operationQueue = [[NSOperationQueue alloc] init];
//    
//    /* Add the operations to the queue */
//    [self.operationQueue addOperation:self.firstOperation];
//    [self.operationQueue addOperation:self.secondOperation];
//    
//    NSLog(@"Main thread is here");
//    
//    self.window = [[UIWindow alloc] initWithFrame:
//                   [[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}

/* 2 */
- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    NSNumber *firstNumber = @111;
    NSNumber *secondNumber = @222;
    
    self.firstOperation = [[SimpleOperation alloc]
                           initWithObject:firstNumber];
    self.secondOperation = [[SimpleOperation alloc]
                            initWithObject:secondNumber];
    
    self.operationQueue = [[NSOperationQueue alloc] init];
    
    /* Add the operations to the queue */
    [self.operationQueue addOperation:self.firstOperation];
    [self.operationQueue addOperation:self.secondOperation];
    
    NSLog(@"Main thread is here");
    
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen] bounds]];
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
