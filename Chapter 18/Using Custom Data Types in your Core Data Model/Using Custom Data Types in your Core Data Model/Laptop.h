//
//  Laptop.h
//  Using Custom Data Types in your Core Data Model
//
//  Created by Vandad NP on 30/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

/* Make sure to import this as UIColor is in UIKit */
#import <UIKit/UIKit.h>


@interface Laptop : NSManagedObject

@property (nonatomic, retain) NSString * model;
@property (nonatomic, retain) UIColor *color;

@end
