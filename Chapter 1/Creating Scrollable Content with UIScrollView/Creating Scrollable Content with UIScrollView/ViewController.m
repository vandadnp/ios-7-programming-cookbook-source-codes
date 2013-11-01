//
//  ViewController.m
//  Creating Scrollable Content with UIScrollView
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"


/* 1 */
//@interface ViewController ()
//@property (nonatomic, strong) UIScrollView *myScrollView;
//@property (nonatomic, strong) UIImageView *myImageView;
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    UIImage *imageToLoad = [UIImage imageNamed:@"MacBookAir"];
//    self.myImageView = [[UIImageView alloc] initWithImage:imageToLoad];
//    self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    [self.myScrollView addSubview:self.myImageView];
//    self.myScrollView.contentSize = self.myImageView.bounds.size;
//    [self.view addSubview:self.myScrollView];
//    
//}

/* 2 */
@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *myScrollView;
@property (nonatomic, strong) UIImageView *myImageView;
@end

@implementation ViewController

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    /* Gets called when user scrolls or drags */
//    self.myScrollView.alpha = 0.50f;
//}
//    
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    /* Gets called only after scrolling */
//    self.myScrollView.alpha = 1.0f;
//}
//    
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
//                  willDecelerate:(BOOL)decelerate{
//    /* Make sure the alpha is reset even if the user is dragging */
//    self.myScrollView.alpha = 1.0f;
//}
//    
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    UIImage *imageToLoad = [UIImage imageNamed:@"MacBookAir"];
//    self.myImageView = [[UIImageView alloc] initWithImage:imageToLoad];
//    self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    [self.myScrollView addSubview:self.myImageView];
//    self.myScrollView.contentSize = self.myImageView.bounds.size;
//    self.myScrollView.delegate = self;
//    [self.view addSubview:self.myScrollView];
//    
//}

/* 3 */
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    /* Gets called when user scrolls or drags */
//    self.myScrollView.alpha = 0.50f;
//}
//    
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    /* Gets called only after scrolling */
//    self.myScrollView.alpha = 1.0f;
//}
//    
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
//                  willDecelerate:(BOOL)decelerate{
//    /* Make sure the alpha is reset even if the user is dragging */
//    self.myScrollView.alpha = 1.0f;
//}
//    
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    UIImage *imageToLoad = [UIImage imageNamed:@"MacBookAir"];
//    self.myImageView = [[UIImageView alloc] initWithImage:imageToLoad];
//    self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    [self.myScrollView addSubview:self.myImageView];
//    self.myScrollView.contentSize = self.myImageView.bounds.size;
//    self.myScrollView.delegate = self;
//    self.myScrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
//    [self.view addSubview:self.myScrollView];
//    
//}

    
/* 4 */
- (UIImageView *) newImageViewWithImage:(UIImage *)paramImage
                                  frame:(CGRect)paramFrame{
    
    UIImageView *result = [[UIImageView alloc] initWithFrame:paramFrame];
    result.contentMode = UIViewContentModeScaleAspectFit;
    result.image = paramImage;
    return result;
    
}
    
- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIImage *iPhone = [UIImage imageNamed:@"iPhone"];
    UIImage *iPad = [UIImage imageNamed:@"iPad"];
    UIImage *macBookAir = [UIImage imageNamed:@"MacBookAir"];
    
    CGRect scrollViewRect = self.view.bounds;
    
    self.myScrollView = [[UIScrollView alloc] initWithFrame:scrollViewRect];
    self.myScrollView.pagingEnabled = YES;
    self.myScrollView.contentSize = CGSizeMake(scrollViewRect.size.width * 3.0f,
                                               scrollViewRect.size.height);
    [self.view addSubview:self.myScrollView];
    
    CGRect imageViewRect = self.view.bounds;
    UIImageView *iPhoneImageView = [self newImageViewWithImage:iPhone
                                                         frame:imageViewRect];
    [self.myScrollView addSubview:iPhoneImageView];
    
    /* Go to next page by moving the x position of the next image view */
    imageViewRect.origin.x += imageViewRect.size.width;
    UIImageView *iPadImageView = [self newImageViewWithImage:iPad
                                                       frame:imageViewRect];
    [self.myScrollView addSubview:iPadImageView];
    
    /* Go to next page by moving the x position of the next image view */
    imageViewRect.origin.x += imageViewRect.size.width;
    UIImageView *macBookAirImageView =
    [self newImageViewWithImage:macBookAir
                          frame:imageViewRect];
    [self.myScrollView addSubview:macBookAirImageView];
    
}

@end
