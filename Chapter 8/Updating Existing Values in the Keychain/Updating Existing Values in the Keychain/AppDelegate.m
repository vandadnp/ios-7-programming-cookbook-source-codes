//
//  AppDelegate.m
//  Updating Existing Values in the Keychain
//
//  Created by Vandad NP on 09/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <Security/Security.h>

@implementation AppDelegate

- (void) readExistingValue{
    
    NSString *keyToSearchFor = @"Full Name";
    NSString *service = [[NSBundle mainBundle] bundleIdentifier];
    
    NSDictionary *query = @{
            (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
            (__bridge id)kSecAttrService : service,
            (__bridge id)kSecAttrAccount : keyToSearchFor,
            (__bridge id)kSecReturnAttributes : (__bridge id)kCFBooleanTrue,
            };
    
    CFDictionaryRef cfAttributes = NULL;
    OSStatus found = SecItemCopyMatching((__bridge CFDictionaryRef)query,
                                         (CFTypeRef *)&cfAttributes);
    
    if (found == errSecSuccess){
        
        NSDictionary *attributes =
            (__bridge_transfer NSDictionary *)cfAttributes;
        
        NSString *comments = attributes[(__bridge id)kSecAttrComment];
        NSLog(@"Comments = %@", comments);
        
    } else {
        NSLog(@"Error happened with code: %ld", (long)found);
    }
    
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    NSString *keyToSearchFor = @"Full Name";
    NSString *service = [[NSBundle mainBundle] bundleIdentifier];
    
    NSDictionary *query = @{
            (__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
            (__bridge id)kSecAttrService : service,
            (__bridge id)kSecAttrAccount : keyToSearchFor,
            };
    
    OSStatus found = SecItemCopyMatching((__bridge CFDictionaryRef)query,
                                           NULL);
    
    if (found == errSecSuccess){
        
        NSData *newData = [@"Mark Tremonti"
                           dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *update = @{
                                 (__bridge id)kSecValueData : newData,
                                 (__bridge id)kSecAttrComment : @"My Comments",
                                 };
        
        OSStatus updated = SecItemUpdate((__bridge CFDictionaryRef)query,
                                         (__bridge CFDictionaryRef)update);
        
        if (updated == errSecSuccess){
            [self readExistingValue];
        } else {
            NSLog(@"Failed to update the value. Error = %ld", (long)updated);
        }
        
        
    } else {
        NSLog(@"Error happened with code: %ld", (long)found);
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
