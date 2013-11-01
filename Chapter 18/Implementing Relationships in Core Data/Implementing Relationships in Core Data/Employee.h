//
//  Employee.h
//  Implementing Relationships in Core Data
//
//  Created by Vandad NP on 25/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Manager;

@interface Employee : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSSet *managers;
@end

@interface Employee (CoreDataGeneratedAccessors)

- (void)addManagersObject:(Manager *)value;
- (void)removeManagersObject:(Manager *)value;
- (void)addManagers:(NSSet *)values;
- (void)removeManagers:(NSSet *)values;

@end
