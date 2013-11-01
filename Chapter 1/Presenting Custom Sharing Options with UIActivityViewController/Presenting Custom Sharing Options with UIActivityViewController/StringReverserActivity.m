//
//  StringReverserActivity.m
//  Presenting Custom Sharing Options with UIActivityViewController
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "StringReverserActivity.h"

@interface StringReverserActivity () <UIAlertViewDelegate>
@property (nonatomic, strong) NSArray *activityItems;
@end

@implementation StringReverserActivity

- (void)            alertView:(UIAlertView *)alertView
    didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [self activityDidFinish:YES];
}

- (NSString *) activityType{
    return [[NSBundle mainBundle].bundleIdentifier
            stringByAppendingFormat:@".%@", NSStringFromClass([self class])];
}

- (NSString *) activityTitle{
    return @"Reverse String";
}

- (UIImage *) activityImage{
    return [UIImage imageNamed:@"Reverse"];
}

- (BOOL) canPerformWithActivityItems:(NSArray *)activityItems{
    
    for (id object in activityItems){
        if ([object isKindOfClass:[NSString class]]){
            return YES;
        }
    }
    
    return NO;
    
}

- (void) prepareWithActivityItems:(NSArray *)activityItems{
    
    NSMutableArray *stringObjects = [[NSMutableArray alloc] init];
    for (id object in activityItems){
        if ([object isKindOfClass:[NSString class]]){
            [stringObjects addObject:object];
        }
    }
    
    self.activityItems = [stringObjects copy];
}

- (NSString *) reverseOfString:(NSString *)paramString{
    
    NSMutableString *reversed = [[NSMutableString alloc]
                                 initWithCapacity:paramString.length];
    
    for (NSInteger counter = paramString.length - 1;
         counter >= 0;
         counter--){
        [reversed appendFormat:@"%c", [paramString characterAtIndex:counter]];
    }
    
    return [reversed copy];
    
}

- (void) performActivity{
    
    NSMutableString *reversedStrings = [[NSMutableString alloc] init];
    
    for (NSString *string in self.activityItems){
        [reversedStrings appendString:[self reverseOfString:string]];
        [reversedStrings appendString:@"\n"];
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Reversed"
                                                        message:reversedStrings
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    
    [alertView show];
    
}

@end
