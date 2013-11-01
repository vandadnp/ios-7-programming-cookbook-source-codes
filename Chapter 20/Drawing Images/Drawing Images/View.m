//
//  View.m
//  Drawing Text
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/* 1 */
//- (void)drawRect:(CGRect)rect{
//    
//    UIImage *image = [UIImage imageNamed:@"Xcode"];
//    
//    if (image != nil){
//        NSLog(@"Successfully loaded the image.");
//    } else {
//        NSLog(@"Failed to load the image.");
//    }
//    
//}

/* 2 */
- (void)drawRect:(CGRect)rect{
    
    /* Assuming the image is in your app bundle and we can load it */
    UIImage *xcodeIcon = [UIImage imageNamed:@"Xcode"];
    
    [xcodeIcon drawAtPoint:CGPointMake(0.0f,
                                       20.0f)];
    
    [xcodeIcon drawInRect:CGRectMake(50.0f,
                                     10.0f,
                                     40.0f,
                                     35.0f)];
    
}

@end
