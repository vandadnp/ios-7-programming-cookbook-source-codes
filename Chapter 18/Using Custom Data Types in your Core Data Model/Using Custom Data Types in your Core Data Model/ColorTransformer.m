//
//  ColorTransformer.m
//  Using Custom Data Types in your Core Data Model
//
//  Created by Vandad NP on 30/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorTransformer.h"

@implementation ColorTransformer

+ (BOOL) allowsReverseTransformation{
    return YES;
}

+ (Class) transformedValueClass{
    return [NSData class];
}

- (id) transformedValue:(id)value{
    
    /* Transform color to data */
    
    UIColor *color = (UIColor *)value;
    
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    CGFloat components[4] = {red, green, blue, alpha};
    NSData *dataFromColors = [[NSData alloc] initWithBytes:components
                                                    length:sizeof(components)];
    return dataFromColors;
    
}

- (id) reverseTransformedValue:(id)value{
    
    /* Transform back from data to color */
    
    NSData *data = (NSData *)value;
    CGFloat components[4] = {0.0f, 0.0f, 0.0f, 0.0f};
    [data getBytes:components length:sizeof(components)];
    
    UIColor *color = [UIColor colorWithRed:components[0]
                                     green:components[1]
                                      blue:components[2]
                                     alpha:components[3]];
    
    return color;
    
}

@end
