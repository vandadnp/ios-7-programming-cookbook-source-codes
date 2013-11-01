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

//- (void)drawRect:(CGRect)rect{
//
//    /* Load the color */
//    UIColor *magentaColor =[UIColor colorWithRed:0.5f
//                                           green:0.0f
//                                            blue:0.5f
//                                           alpha:1.0f];
//    
//    /* Set the color in the graphical context */
//    [magentaColor set];
//    
//    /* Load the font */
//    UIFont *helveticaBold = [UIFont fontWithName:@"HelveticaNeue-Bold"
//                                            size:30.0f];
//    
//    /* Our string to be drawn */
//    NSString *myString = @"I Learn Really Fast";
//    
//    /* Draw the string using the font. The color has
//     already been set */
//    [myString drawAtPoint:CGPointMake(25, 190)
//           withAttributes:@{
//                            NSFontAttributeName : helveticaBold
//                            }];
//    
//}

/* 2 */
//- (void)drawRect:(CGRect)rect{
//    
//    /* Load the color */
//    UIColor *magentaColor = [UIColor colorWithRed:0.5f
//                                            green:0.0f
//                                             blue:0.5f
//                                            alpha:1.0f];
//    
//    /* Set the color in the graphical context */
//    [magentaColor set];
//    
//    /* Load the font */
//    UIFont *helveticaBold = [UIFont boldSystemFontOfSize:30];
//    
//    /* Our string to be drawn */
//    NSString *myString = @"I Learn Really Fast";
//    
//    /* Draw the string using the font. The color has
//     already been set */
//    
//    [myString drawWithRect:CGRectMake(100,  /* x */
//                                      120,  /* y */
//                                      100,  /* width */
//                                      200)
//                   options:NSStringDrawingUsesLineFragmentOrigin
//                attributes:@{
//                             NSFontAttributeName : helveticaBold
//                             }
//                   context:nil];
//    
//}

/* 3 */
- (void) drawRect:(CGRect)rect{
    
    /* Load the color */
    UIColor *steelBlueColor = [UIColor colorWithRed:0.3f
                                              green:0.4f
                                               blue:0.6f
                                              alpha:1.0f];
    
    CGColorRef colorRef = steelBlueColor.CGColor;
    
    const CGFloat *components = CGColorGetComponents(colorRef);
    
    NSUInteger componentsCount = CGColorGetNumberOfComponents(colorRef);
    
    NSUInteger counter = 0;
    for (counter = 0;
         counter < componentsCount;
         counter++){
        NSLog(@"Component %lu = %.02f",
              (unsigned long)counter + 1,
              components[counter]);
    }
    
}

@end
