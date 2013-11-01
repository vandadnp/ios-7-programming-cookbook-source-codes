//
//  SecondViewController.m
//  Implementing Navigation with UINavigationController
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Second Controller";
}

/* 1 */
//- (void) goBack{
//    /* Get the current array of View Controllers */
//    NSArray *currentControllers = self.navigationController.viewControllers;
//    
//    /* Create a mutable array out of this array */
//    NSMutableArray *newControllers = [NSMutableArray
//                                      arrayWithArray:currentControllers];
//    
//    /* Remove the last object from the array */
//    [newControllers removeLastObject];
//    
//    /* Assign this array to the Navigation Controller */
//    self.navigationController.viewControllers = newControllers;
//}
    
/* 2 */
- (void) goBack{
    /* Get the current array of View Controllers */
    NSArray *currentControllers = self.navigationController.viewControllers;
    
    /* Create a mutable array out of this array */
    NSMutableArray *newControllers = [NSMutableArray
                                      arrayWithArray:currentControllers];
    
    /* Remove the last object from the array */
    [newControllers removeLastObject];
    
    /* Assign this array to the Navigation Controller with animation */
    [self.navigationController setViewControllers:newControllers
                                         animated:YES];
}
    
- (void) viewDidAppear:(BOOL)paramAnimated{
    [super viewDidAppear:paramAnimated];
    [self performSelector:@selector(goBack)
               withObject:nil
               afterDelay:5.0f];
}

@end
