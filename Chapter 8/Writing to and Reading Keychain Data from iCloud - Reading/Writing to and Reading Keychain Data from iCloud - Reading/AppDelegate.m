//
//  AppDelegate.m
//  Writing to and Reading Keychain Data from iCloud - Reading
//
//  Created by Vandad NP on 15/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <Security/Security.h>

@implementation AppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    NSString *key = @"Full Name";
    /* This is the bundle ID of the app that wrote the data to the 
     iCloud keychain. This is NOT this app's bundle ID. This app's bundle ID is
     com.pixolity.ios.cookbook.SecondSecurityApp */
    NSString *service = @"com.pixolity.ios.cookbook.SecurityApp";
    NSString *accessGroup = @"F3FU372W5M.*";
    
    NSDictionary *queryDictionary = @{
              (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
              (__bridge id)kSecAttrService : service,
              (__bridge id)kSecAttrAccessGroup : accessGroup,
              (__bridge id)kSecAttrAccount : key,
              (__bridge id)kSecReturnData : (__bridge id)kCFBooleanTrue,
              (__bridge id)kSecAttrSynchronizable : (__bridge id)kCFBooleanTrue
              };
    
    CFDataRef data = NULL;
    OSStatus found =
        SecItemCopyMatching((__bridge CFDictionaryRef)queryDictionary,
                            (CFTypeRef *)&data);
    
    if (found == errSecSuccess){
        NSString *value = [[NSString alloc]
                           initWithData:(__bridge_transfer NSData *)data
                           encoding:NSUTF8StringEncoding];
        
        NSLog(@"Value = %@", value);
        
    } else {
        NSLog(@"Failed to read the value with error = %ld", (long)found);
    }
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
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
