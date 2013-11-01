//
//  CountingOperation.m
//  Operations
//
//  Created by Vandad Nahavandipoor on 11-08-29.
//  Copyright 2011  All rights reserved.
//

#import "SimpleOperation.h"

@interface SimpleOperation ()
@property (nonatomic, strong) NSObject *givenObject;
@property (nonatomic, unsafe_unretained, getter=isFinished) BOOL finished;
@property (nonatomic, unsafe_unretained, getter=isExecuting) BOOL executing;
@end

@implementation SimpleOperation

- (instancetype) init {
    return([self initWithObject:@123]);
}

- (instancetype) initWithObject:(NSObject *)paramObject{
    self = [super init];
    if (self != nil){
        /* Keep these values for the main method */
        _givenObject = paramObject;
    }
    return(self);
}

- (void) main {
    
    @try {
        @autoreleasepool {
            /* Keep a local variable here that must get set to YES
             whenever we are done with the task */
            BOOL taskIsFinished = NO;
            
            /* Create a while loop here that only exists
             if the taskIsFinished variable is set to YES or
             the operation has been cancelled */
            while (taskIsFinished == NO &&
                   [self isCancelled] == NO){
                
                /* Perform the task here */
                NSLog(@"%s", __FUNCTION__);
                NSLog(@"Parameter Object = %@", _givenObject);
                NSLog(@"Main Thread = %@", [NSThread mainThread]);
                NSLog(@"Current Thread = %@", [NSThread currentThread]);
                
                /* Very important. This way we can get out of the
                 loop and we are still complying with the cancellation
                 rules of operations */
                taskIsFinished = YES;
                
            }
            
            /* KVO compliance. Generate the
             required KVO notifications */
            [self willChangeValueForKey:@"isFinished"];
            [self willChangeValueForKey:@"isExecuting"];
            _finished = YES;
            _executing = NO;
            [self didChangeValueForKey:@"isFinished"];
            [self didChangeValueForKey:@"isExecuting"];
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception %@", e);
    }
    
}

- (BOOL)  isConcurrent{
    return YES;
}

@end