//
//  Person.m
//  Chapter 1-Introduction
//
//  Created by Vandad NP on 06/04/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (CGFloat) maximumHeightInCentimeters{
    return 250.0f;
}

+ (CGFloat) minimumHeightInCentimeters{
    return 40.0f;
}

@end

//#import "Person.h"
//
//@implementation Person
//
//- (void) walkAtKilometersPerHour:(CGFloat)paramSpeedKilometersPerHour{
//    /* Write the code for this method here */
//}
//
//- (void) runAt10KilometersPerHour{
//    /* Call the walk method in our own class and pass the value of 10 */
//    [self walkAtKilometersPerHour:10.0f];
//}
//
//- (void) singSong:(NSData *)paramSongData loudly:(BOOL)paramLoudly{
//    /* The parameters that we can access here in this method are:
//     
//     paramSongData (to access the song's data)
//     paramLoudly will tell us if we have to sing the song loudly or not
//     */
//}
//
//@end
