//
//  FirstViewController.m
//  Implementing Navigation with UINavigationController
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (nonatomic, strong) UIButton *displaySecondViewController;
@end

@implementation FirstViewController
    
- (void)viewDidLoad{
    [super viewDidLoad];
    
    /* Create an Image View to replace the Title View */
    UIImageView *imageView =
    [[UIImageView alloc]
     initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 40.0f)];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    /* Load an image. Be careful, this image will be cached */
    UIImage *image = [UIImage imageNamed:@"Logo"];
    
    /* Set the image of the Image View */
    [imageView setImage:image];
    
    /* Set the Title View */
    self.navigationItem.titleView = imageView;
    
}

@end
