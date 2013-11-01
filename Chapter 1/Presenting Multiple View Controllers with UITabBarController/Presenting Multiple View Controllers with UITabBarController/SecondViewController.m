//
//  SecondViewController.m
//  Presenting Multiple View Controllers with UITabBarController
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

/* 1 */
//- (id)initWithNibName:(NSString *)nibNameOrNil
//               bundle:(NSBundle *)nibBundleOrNil{
//    
//    self = [super initWithNibName:nibNameOrNil
//                           bundle:nibBundleOrNil];
//    if (self != nil) {
//        self.title = @"Second";
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
        self.title = @"Second";
        self.tabBarItem.image = [UIImage imageNamed:@"SecondTab"];
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
