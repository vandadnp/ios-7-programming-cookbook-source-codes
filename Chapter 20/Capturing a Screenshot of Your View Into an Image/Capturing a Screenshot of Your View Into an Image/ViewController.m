//
//  ViewController.m
//  Capturing a Screenshot of Your View Into an Image
//
//  Created by Vandad NP on 10/07/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    /* Capture the screenshot */
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0.0f);
    if ([self.view drawViewHierarchyInRect:self.view.bounds]){
        NSLog(@"Successfully draw the screenshot.");
    } else {
        NSLog(@"Failed to draw the screenshot.");
    }
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    /* Save it to disk */
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSURL *documentsFolder = [fileManager URLForDirectory:NSDocumentDirectory
                                                 inDomain:NSUserDomainMask
                                        appropriateForURL:nil
                                                   create:YES
                                                    error:nil];
    NSURL *screenshotUrl = [documentsFolder
                           URLByAppendingPathComponent:@"screenshot.png"];
    
    NSData *screenshotData = UIImagePNGRepresentation(screenshot);
    
    if ([screenshotData writeToURL:screenshotUrl atomically:YES]){
        NSLog(@"Successfully saved screenshot to %@", screenshotUrl);
    } else {
        NSLog(@"Failed to save screenshot.");
    }
    
}


@end
