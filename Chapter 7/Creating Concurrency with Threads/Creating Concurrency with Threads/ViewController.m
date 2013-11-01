//
//  ViewController.m
//  Creating Concurrency with Threads
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSThread *myThread;
@end

@implementation ViewController

/* 1 */
//- (void) downloadNewFile:(id)paramObject{
//    
//    @autoreleasepool {
//        NSString *fileURL = (NSString *)paramObject;
//        
//        NSURL    *url = [NSURL URLWithString:fileURL];
//        
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        
//        NSURLResponse *response = nil;
//        NSError       *error = nil;
//        
//        NSData *downloadedData =
//        [NSURLConnection sendSynchronousRequest:request
//                              returningResponse:&response
//                                          error:&error];
//        
//        if ([downloadedData length] > 0){
//            /* Fully downloaded */
//        } else {
//            /* Nothing was downloaded. Check the Error value */
//        }
//    }
//    
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    NSString *fileToDownload = @"http://www.OReilly.com";
//    
//    [NSThread detachNewThreadSelector:@selector(downloadNewFile:)
//                             toTarget:self
//                           withObject:fileToDownload];
//    
//}


/* 2 */
//- (void) firstCounter{
//    
//    NSUInteger counter = 0;
//    for (counter = 0;
//         counter < 1000;
//         counter++){
//        NSLog(@"First Counter = %lu", (unsigned long)counter);
//    }
//    
//}
//
//- (void) secondCounter{
//    
//    NSUInteger counter = 0;
//    for (counter = 0;
//         counter < 1000;
//         counter++){
//        NSLog(@"Second Counter = %lu", (unsigned long)counter);
//    }
//    
//}
//
//- (void) thirdCounter{
//    
//    NSUInteger counter = 0;
//    for (counter = 0;
//         counter < 1000;
//         counter++){
//        NSLog(@"Third Counter = %lu", (unsigned long)counter);
//    }
//    
//}

/* 3 */
//- (void) firstCounter{
//
//  NSUInteger counter = 0;
//  for (counter = 0;
//       counter < 1000;
//       counter++){
//    NSLog(@"First Counter = %lu", (unsigned long)counter);
//  }
//
//}
//
//- (void) secondCounter{
//
//  NSUInteger counter = 0;
//  for (counter = 0;
//       counter < 1000;
//       counter++){
//    NSLog(@"Second Counter = %lu", (unsigned long)counter);
//  }
//
//}
//
//- (void) thirdCounter{
//
//  NSUInteger counter = 0;
//  for (counter = 0;
//       counter < 1000;
//       counter++){
//    NSLog(@"Third Counter = %lu", (unsigned long)counter);
//  }
//
//}
//
//- (void) viewDidLoad{
//    [super viewDidLoad];
//    [self firstCounter];
//    [self secondCounter];
//    [self thirdCounter];
//}

/* 4 */
//- (void) firstCounter{
//    
//    @autoreleasepool {
//        NSUInteger counter = 0;
//        for (counter = 0;
//             counter < 1000;
//             counter++){
//            NSLog(@"First Counter = %lu", (unsigned long)counter);
//        }
//    }
//    
//}
//
//- (void) secondCounter{
//    
//    @autoreleasepool {
//        NSUInteger counter = 0;
//        for (counter = 0;
//             counter < 1000;
//             counter++){
//            NSLog(@"Second Counter = %lu", (unsigned long)counter);
//        }
//    }
//    
//}
//
//- (void) thirdCounter{
//    
//    NSUInteger counter = 0;
//    for (counter = 0;
//         counter < 1000;
//         counter++){
//        NSLog(@"Third Counter = %lu", (unsigned long)counter);
//    }
//    
//}
//
//- (void)viewDidLoad {
//    
//    [super viewDidLoad];
//    
//    [NSThread detachNewThreadSelector:@selector(firstCounter)
//                             toTarget:self
//                           withObject:nil];
//    
//    
//    [NSThread detachNewThreadSelector:@selector(secondCounter)
//                             toTarget:self
//                           withObject:nil];
//    
//    /* Run this on the main thread */
//    [self thirdCounter];
//    
//}

/* 5 */
//- (void) autoreleaseThread:(id)paramSender{
//    
//    NSBundle *mainBundle = [NSBundle mainBundle];
//    NSString *filePath = [mainBundle pathForResource:@"MacBookAir"
//                                              ofType:@"png"];
//    
//    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
//    
//    /* Do something with the image */
//    NSLog(@"Image = %@", image);
//    
//}
//
//- (void)viewDidLoad {
//    
//    [super viewDidLoad];
//    
//    [NSThread detachNewThreadSelector:@selector(autoreleaseThread:)
//                             toTarget:self
//                           withObject:self];
//    
//}

/* 6 */
- (void) autoreleaseThread:(id)paramSender{
    
    @autoreleasepool {
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *filePath = [mainBundle pathForResource:@"MacBookAir"
                                                  ofType:@"png"];
        
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        
        /* Do something with the image */
        NSLog(@"Image = %@", image);
    }
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [NSThread detachNewThreadSelector:@selector(autoreleaseThread:)
                             toTarget:self
                           withObject:self];
    
}


//- (void)viewDidLoad {
//
//  [super viewDidLoad];
//
//  [NSThread detachNewThreadSelector:@selector(autoreleaseThread:)
//                           toTarget:self
//                         withObject:self];
//
//}


//- (void)viewDidLoad {
//
//  [super viewDidLoad];
//
//  NSThread *newThread =
//  [[NSThread alloc] initWithTarget:self
//                          selector:@selector(autoreleaseThread:)
//                            object:self];
//
//  [newThread start];
//  self.myThread = newThread;
//  [newThread release];
//  
//  
//}

@end
