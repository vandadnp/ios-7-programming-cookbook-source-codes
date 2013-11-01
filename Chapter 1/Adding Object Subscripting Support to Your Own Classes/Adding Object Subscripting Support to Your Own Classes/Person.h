//
//  Person.h
//  Adding Object Subscripting Support to Your Own Classes
//
//  Created by Vandad NP on 06/07/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

/* We will use these as the keys to our firstName and lastName 
 properties so that if our firstName and lastName properties' name 
 changes in the future in the implementation, we won't break anything
 and our class will still work as we can simply change the value of
 these constants inside our implementation file */
extern NSString *const kFirstNameKey;
extern NSString *const kLastNameKey;

@interface Person : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

/* Subscripting by Key */

- (id) objectForKeyedSubscript:(id<NSCopying>)paramKey;
- (void) setObject:(id)paramObject forKeyedSubscript:(id<NSCopying>)paramKey;

/* Subscripting by index */
- (id) objectAtIndexedSubscript:(NSUInteger)paramIndex;
- (void) setObject:(id)paramObject atIndexedSubscript:(NSUInteger)paramIndex;

@end
