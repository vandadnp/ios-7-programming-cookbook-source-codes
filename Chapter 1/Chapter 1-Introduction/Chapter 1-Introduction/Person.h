//
//  Person.h
//  Chapter 1-Introduction
//
//  Created by Vandad NP on 06/04/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, assign) CGFloat currentHeight;

+ (CGFloat) maximumHeightInCentimeters;
+ (CGFloat) minimumHeightInCentimeters;

@end

//#import <Foundation/Foundation.h>
//
//@interface Person : NSObject
//
//@property (nonatomic, copy) NSString *firstName;
//@property (nonatomic, copy) NSString *lastName;
//
//@end
