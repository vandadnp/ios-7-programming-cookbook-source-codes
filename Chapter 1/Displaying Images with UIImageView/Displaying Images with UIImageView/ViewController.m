//
//  ViewController.m
//  Displaying Images with UIImageView
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *myImageView;
@end

@implementation ViewController

/* 1 */
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    UIImage *macBookAir = [UIImage imageNamed:@"MacBookAir"];
//    self.myImageView = [[UIImageView alloc] initWithImage:macBookAir];
//    self.myImageView.center = self.view.center;
//    [self.view addSubview:self.myImageView];
//    
//}
    
/* 2 */
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    UIImage *macBookAir = [UIImage imageNamed:@"MacBookAir"];
//    self.myImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    self.myImageView.image = macBookAir;
//    self.myImageView.center = self.view.center;
//    [self.view addSubview:self.myImageView];
//    
//}
    
/* 3 */
- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIImage *macBookAir = [UIImage imageNamed:@"MacBookAir"];
    self.myImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.myImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.myImageView.image = macBookAir;
    self.myImageView.center = self.view.center;
    [self.view addSubview:self.myImageView];
}

@end
