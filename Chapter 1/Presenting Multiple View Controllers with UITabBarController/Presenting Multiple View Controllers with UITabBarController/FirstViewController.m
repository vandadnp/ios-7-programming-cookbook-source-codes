//
//  FirstViewController.m
//  Presenting Multiple View Controllers with UITabBarController
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController
    
/* 1 */
//- (id)initWithNibName:(NSString *)nibNameOrNil
//               bundle:(NSBundle *)nibBundleOrNil{
//    
//    self = [super initWithNibName:nibNameOrNil
//                           bundle:nibBundleOrNil];
//    if (self != nil) {
//        self.title = @"First";
//    }
//    return self;
//    
//}
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//}

/* 2 */
- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self != nil) {
        self.title = @"First";
        self.tabBarItem.image = [UIImage imageNamed:@"FirstTab"];
    }
    return self;
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
