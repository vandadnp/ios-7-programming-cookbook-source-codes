//
//  Car.h
//  Chapter 1-Introduction
//
//  Created by Vandad NP on 07/04/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Car <NSObject>

@property (nonatomic, copy) NSArray *wheels;
@property (nonatomic, strong) UIColor *bodyColor;
@property (nonatomic, copy) NSArray *doors;

@end