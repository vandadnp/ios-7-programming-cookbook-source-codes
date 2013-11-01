//
//  Person.m
//  Adding Object Subscripting Support to Your Own Classes
//
//  Created by Vandad NP on 06/07/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "Person.h"

NSString *const kFirstNameKey = @"firstName";
NSString *const kLastNameKey = @"lastName";

@implementation Person

/* Subscripting by key */
- (id) objectForKeyedSubscript:(id<NSCopying>)paramKey{
    
    NSObject<NSCopying> *keyAsObject = (NSObject<NSCopying> *)paramKey;
    if ([keyAsObject isKindOfClass:[NSString class]]){
        NSString *keyAsString = (NSString *)keyAsObject;
        if ([keyAsString isEqualToString:kFirstNameKey] ||
            [keyAsString isEqualToString:kLastNameKey]){
            return [self valueForKey:keyAsString];
        }
    }
    
    return nil;
}

- (void) setObject:(id)paramObject forKeyedSubscript:(id<NSCopying>)paramKey{
    NSObject<NSCopying> *keyAsObject = (NSObject<NSCopying> *)paramKey;
    if ([keyAsObject isKindOfClass:[NSString class]]){
        NSString *keyAsString = (NSString *)keyAsObject;
        if ([keyAsString isEqualToString:kFirstNameKey] ||
            [keyAsString isEqualToString:kLastNameKey]){
            [self setValue:paramObject forKey:keyAsString];
        }
    }
}

/* Subscripting by index */

- (id) objectAtIndexedSubscript:(NSUInteger)paramIndex{
    
    switch (paramIndex){
        case 0:{
            return self.firstName;
            break;
        }
        case 1:{
            return self.lastName;
            break;
        }
        default:{
            [NSException raise:@"Invalid index" format:nil];
        }
    }
    
    return nil;
}

- (void) setObject:(id)paramObject atIndexedSubscript:(NSUInteger)paramIndex{
    switch (paramIndex){
        case 0:{
            self.firstName = paramObject;
            break;
        }
        case 1:{
            self.lastName = paramObject;
            break;
        }
        default:{
            [NSException raise:@"Invalid index" format:nil];
        }
    }
}

@end
