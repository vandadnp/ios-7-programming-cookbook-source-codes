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

- (void)drawRect:(CGRect)rect{
    
    UIFont *helveticaBold =  [UIFont fontWithName:@"HelveticaNeue-Bold"
                                             size:40.0f];
    
    NSString *myString = @"Some String";
    
    [myString drawAtPoint:CGPointMake(40, 180)
           withAttributes:@{
                            NSFontAttributeName : helveticaBold
                            }];
    
}

@end
