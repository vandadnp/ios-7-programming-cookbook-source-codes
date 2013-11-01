//
//  Person.h
//  Fetching Data in the Background
//
//  Created by Vandad NP on 30/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * age;

@end
