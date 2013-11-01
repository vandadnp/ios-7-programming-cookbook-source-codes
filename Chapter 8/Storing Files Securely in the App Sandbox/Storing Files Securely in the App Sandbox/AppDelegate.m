//
//  AppDelegate.m
//  Storing Files Securely in the App Sandbox
//
//  Created by Vandad NP on 15/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (NSString *) filePath{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    NSError *error = nil;
    NSURL *documentFolderUrl = [fileManager URLForDirectory:NSDocumentDirectory
                                                   inDomain:NSUserDomainMask
                                          appropriateForURL:nil
                                                     create:YES
                                                      error:&error];
    
    if (error == nil && documentFolderUrl != nil){
        NSString *fileName = @"MyFile.txt";
        NSString *filePath = [documentFolderUrl.path
                              stringByAppendingPathComponent:fileName];
        
        return filePath;
    }
    
    return nil;
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    /*
     Prerequisites:
     
        1) Sign with a valid provision profile
        2) Your profile has to have complete-file-protection enabled.
        3) Add Code Signing Entitlements to your project
     */
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    if ([self filePath] != nil){
        
        NSData *dataToWrite = [@"Hello, World"
                               dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *fileAttributes = @{
                                 NSFileProtectionKey : NSFileProtectionComplete
                                 };
        
        BOOL wrote = [fileManager createFileAtPath:[self filePath]
                                          contents:dataToWrite
                                        attributes:fileAttributes];
        
        if (wrote){
            NSLog(@"Successfully and securely stored the file");
        } else {
            NSLog(@"Failed to write the file");
        }
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
