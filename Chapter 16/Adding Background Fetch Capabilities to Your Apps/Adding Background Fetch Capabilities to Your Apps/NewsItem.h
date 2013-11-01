//
//  NewsItem.h
//  Adding Background Fetch Capabilities to Your Apps
//
//  Created by Vandad NP on 30/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsItem : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, copy) NSString *text;

@end
