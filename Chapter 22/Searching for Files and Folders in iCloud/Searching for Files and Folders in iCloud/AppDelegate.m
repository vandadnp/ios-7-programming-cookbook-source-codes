//
//  AppDelegate.m
//  Searching for Files and Folders in iCloud
//
//  Created by Vandad NP on 29/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, strong) NSMetadataQuery *metadataQuery;
@end

@implementation AppDelegate

- (NSURL *) urlForDocumentsFolderIniCloud{
    
    NSURL *result = nil;
    
    NSString *teamID = @"F3FU372W5M";
    
    NSString *containerID = [[NSBundle mainBundle] bundleIdentifier];
    
    NSString *teamIDAndContainerID = [[NSString alloc] initWithFormat:@"%@.%@",
                                      teamID, containerID];
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    NSURL *appiCloudContainerURL =
    [fileManager URLForUbiquityContainerIdentifier:teamIDAndContainerID];
    
    result = [appiCloudContainerURL URLByAppendingPathComponent:@"Documents"
                                                    isDirectory:YES];
    
    if ([fileManager fileExistsAtPath:[result path]] == NO){
        
        /* The Documents directory does NOT exist in our app's iCloud 
         container; attempt to create it now */
        
        NSError *creationError = nil;
        BOOL created = [fileManager createDirectoryAtURL:result
                             withIntermediateDirectories:YES
                                              attributes:nil
                                                   error:&creationError];
        
        if (created){
            NSLog(@"Successfully created the Documents folder in iCloud.");
        } else {
            NSLog(@"Failed to create the Documents folder in \
                  iCloud. Error = %@", creationError);
            result = nil;
        }
        
    } else {
        /* the Documents directory already exists in our app's
         iCloud container; we don't have to do anything */
    }
    
    return result;
    
}

- (NSURL *) urlForRandomFileInDocumentsFolderInIcloud{
    
    NSURL *result = nil;
    
    NSUInteger randomNumber = arc4random() % NSUIntegerMax;
    
    NSString *randomFileName = [[NSString alloc] initWithFormat:@"%lu.txt",
                                (unsigned long)randomNumber];
    
    /* Check in the metadata query if this file already exists */
    __block BOOL fileExistsAlready = NO;
    [self.metadataQuery.results enumerateObjectsUsingBlock:
     ^(NSMetadataItem *item, NSUInteger idx, BOOL *stop) {
         NSString *itemFileName =
            [item valueForAttribute:NSMetadataItemFSNameKey];
         if ([itemFileName isEqualToString:randomFileName]){
             NSLog(@"This file already exists. Aborting...");
             fileExistsAlready = YES;
             *stop = YES;
         }
     }];
    
    if (fileExistsAlready){
        return nil;
    }
    
    result = [[self urlForDocumentsFolderIniCloud]
              URLByAppendingPathComponent:randomFileName];
    
    return result;
    
}

- (NSURL *) urlForRandomFileInDocumentsFolderForFileWithName
            :(NSString *)paramFileName{

    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSURL *documentsUrl = [fileManager URLForDirectory:NSDocumentDirectory
                                              inDomain:NSUserDomainMask
                                     appropriateForURL:Nil
                                                create:YES
                                                 error:nil];
    
    return [documentsUrl URLByAppendingPathComponent:paramFileName];
    
}

- (void) enumerateMetadataResults:(NSArray *)paramResults{
    
    [paramResults enumerateObjectsUsingBlock:
     ^(NSMetadataItem *item, NSUInteger index, BOOL *stop) {
         
         NSString *itemName = [item valueForAttribute:NSMetadataItemFSNameKey];
         NSURL *itemURL = [item valueForAttribute:NSMetadataItemURLKey];
         NSNumber *itemSize = [item valueForAttribute:NSMetadataItemFSSizeKey];
         
         NSLog(@"Item name = %@", itemName);
         NSLog(@"Item URL = %@", itemURL);
         NSLog(@"Item Size = %llu",
               (unsigned long long)[itemSize unsignedLongLongValue]);
         
     }];
    
}

- (void) handleMetadataQueryFinished:(id)paramSender{
    
    NSLog(@"Search finished");
    
    if ([[paramSender object] isEqual:self.metadataQuery] == NO){
        NSLog(@"An unknown object called this method. Not safe to proceed.");
        return;
    }
    
    /* Stop listening for notifications as we are not expecting 
     anything more */
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    /* We are done with the query, let's stop the process now */
    [self.metadataQuery disableUpdates];
    [self.metadataQuery stopQuery];
    
    [self enumerateMetadataResults:self.metadataQuery.results];
    
    if ([self.metadataQuery.results count] == 0){
        NSLog(@"No files were found.");
    }
    
    NSURL *urlForFileIniCloud =
    [self urlForRandomFileInDocumentsFolderInIcloud];
    
    if (urlForFileIniCloud == nil){
        NSLog(@"Cannot create a file with this URL. URL is empty.");
        return;
    }
    
    NSString *fileName = [[[urlForFileIniCloud path]
                           componentsSeparatedByString:@"/"] lastObject];
    
    NSURL *urlForFileInAppSandbox =
    [self urlForRandomFileInDocumentsFolderForFileWithName:fileName];
    
    NSString *fileContent =
    [[NSString alloc] initWithFormat:@"Content of %@",
     [[self urlForRandomFileInDocumentsFolderInIcloud] path]];
    
    /* Save the file temporarily in the app bundle and then move
     it to the cloud */
    NSError *writingError = nil;
    BOOL couldWriteToAppSandbox =
    [fileContent writeToFile:[urlForFileInAppSandbox path]
                  atomically:YES
                    encoding:NSUTF8StringEncoding
                       error:&writingError];
    
    /* If cannot save the file, just return from method because it 
     won't make any sense to continue as we, ideally, should have 
     stored the file in iCloudfrom the app sandbox but here, if an 
     error has occurred, we cannot continue */
    if (couldWriteToAppSandbox == NO){
        NSLog(@"Failed to save the file to app sandbox. Error = %@",
              writingError);
        return;
    }
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    /* Now move the file to the cloud */
    NSError *ubiquitousError = nil;
    BOOL setUbiquitousSucceeded =
    [fileManager setUbiquitous:YES
                     itemAtURL:urlForFileInAppSandbox
                destinationURL:urlForFileIniCloud
                         error:&ubiquitousError];
    
    if (setUbiquitousSucceeded){
        NSLog(@"Successfully moved the file to iCloud.");
        /* The file has been moved from App Sandbox to iCloud */
    } else {
        NSLog(@"Failed to move the file to iCloud with error = %@",
              ubiquitousError);
    }
    
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    /* Listen for a notification that gets fired when the metadata query
     has finished finding the items we were looking for */
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleMetadataQueryFinished:)
     name:NSMetadataQueryDidFinishGatheringNotification
     object:nil];
    
    /* Create our query now */
    self.metadataQuery = [[NSMetadataQuery alloc] init];
    NSArray *searchScopes = [[NSArray alloc] initWithObjects:
                             NSMetadataQueryUbiquitousDocumentsScope, nil];
    [self.metadataQuery setSearchScopes:searchScopes];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"%K like %@",
                              NSMetadataItemFSNameKey,
                              @"*"];
    [self.metadataQuery setPredicate:predicate];
    if ([self.metadataQuery startQuery]){
        NSLog(@"Successfully started the query.");
    } else {
        NSLog(@"Failed to start the query.");
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
