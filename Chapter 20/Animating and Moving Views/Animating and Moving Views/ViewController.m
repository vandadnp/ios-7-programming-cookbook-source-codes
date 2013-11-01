//
//  ViewController.m
//  Animating and Moving Views
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

/* 1 */
//@interface ViewController ()
//@property (nonatomic, strong) UIImageView *xcodeImageView;
//@end
//
//@implementation ViewController
//
//- (void) viewDidLoad{
//    [super viewDidLoad];
//
//    UIImage *xcodeImage = [UIImage imageNamed:@"Xcode"];
//
//    self.xcodeImageView = [[UIImageView alloc]
//                           initWithImage:xcodeImage];
//
//    /* Just set the size to make the image smaller */
//    [self.xcodeImageView setFrame:CGRectMake(0.0f,
//                                             30.0f,
//                                             100.0f,
//                                             100.0f)];
//
//    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.xcodeImageView];
//
//}
//
//- (void)imageViewDidStop:(NSString *)paramAnimationID
//                finished:(NSNumber *)paramFinished
//                 context:(void *)paramContext{
//
//    NSLog(@"Animation finished.");
//
//    NSLog(@"Animation ID = %@", paramAnimationID);
//
//    UIImageView *contextImageView = (__bridge UIImageView *)paramContext;
//    NSLog(@"Image View = %@", contextImageView);
//
//}
//
//- (void) viewDidAppear:(BOOL)paramAnimated{
//
//    [super viewDidAppear:paramAnimated];
//
//    /* Start from top left corner */
//    [self.xcodeImageView setFrame:CGRectMake(0.0f,
//                                             30.0f,
//                                             100.0f,
//                                             100.0f)];
//
//    [UIView beginAnimations:@"xcodeImageViewAnimation"
//                    context:(__bridge void *)self.xcodeImageView];
//
//    /* 5 seconds animation */
//    [UIView setAnimationDuration:5.0f];
//
//    /* Receive animation delegates */
//    [UIView setAnimationDelegate:self];
//
//    [UIView setAnimationDidStopSelector:
//     @selector(imageViewDidStop:finished:context:)];
//
//    CGRect endRect;
//    endRect.origin.x = self.view.bounds.size.width - 100;
//    endRect.origin.y = self.view.bounds.size.height - 100;
//    endRect.size = CGSizeMake(100.0f, 100.0f);
//
//    /* End at the bottom right corner */
//    [self.xcodeImageView setFrame:endRect];
//
//    [UIView commitAnimations];
//
//}

/* 2 */
@interface ViewController ()
@property (nonatomic, strong) UIImageView *xcodeImageView1;
@property (nonatomic, strong) UIImageView *xcodeImageView2;
@end

@implementation ViewController

- (void)imageViewDidStop:(NSString *)paramAnimationID
                finished:(NSNumber *)paramFinished
                 context:(void *)paramContext{
    
    UIImageView *contextImageView = (__bridge UIImageView *)paramContext;
    [contextImageView removeFromSuperview];
    
}

- (void) startBottomRightViewAnimationAfterDelay:(CGFloat)paramDelay{
    
    /* Start from bottom right corner */
    [self.xcodeImageView2 setFrame:[self bottomRightRect]];
    
    [self.xcodeImageView2 setAlpha:1.0f];
    
    [UIView beginAnimations:@"xcodeImageView2Animation"
                    context:(__bridge void *)self.xcodeImageView2];
    
    /* 3 seconds animation */
    [UIView setAnimationDuration:3.0f];
    
    [UIView setAnimationDelay:paramDelay];
    
    /* Receive animation delegates */
    [UIView setAnimationDelegate:self];
    
    [UIView setAnimationDidStopSelector:
     @selector(imageViewDidStop:finished:context:)];
    
    /* End at the top left corner */
    [self.xcodeImageView2 setFrame:CGRectMake(0.0f,
                                              0.0f,
                                              100.0f,
                                              100.0f)];
    
    [self.xcodeImageView2 setAlpha:0.0f];
    
    [UIView commitAnimations];
    
}

- (void) startTopLeftImageViewAnimation{
    
    /* Start from top left corner */
    [self.xcodeImageView1 setFrame:CGRectMake(0.0f,
                                              0.0f,
                                              100.0f,
                                              100.0f)];
    
    [self.xcodeImageView1 setAlpha:1.0f];
    
    [UIView beginAnimations:@"xcodeImageView1Animation"
                    context:(__bridge void *)self.xcodeImageView1];
    
    /* 3 seconds animation */
    [UIView setAnimationDuration:3.0f];
    
    /* Receive animation delegates */
    [UIView setAnimationDelegate:self];
    
    [UIView setAnimationDidStopSelector:
     @selector(imageViewDidStop:finished:context:)];
    
    /* End at the bottom right corner */
    [self.xcodeImageView1 setFrame:[self bottomRightRect]];
    
    [self.xcodeImageView1 setAlpha:0.0f];
    
    [UIView commitAnimations];
    
}

- (CGRect) bottomRightRect{
    CGRect endRect;
    endRect.origin.x = self.view.bounds.size.width - 100;
    endRect.origin.y = self.view.bounds.size.height - 100;
    endRect.size = CGSizeMake(100.0f, 100.0f);
    return endRect;
}

- (void) viewDidLoad{
    [super viewDidLoad];
    
    UIImage *xcodeImage = [UIImage imageNamed:@"Xcode"];
    
    self.xcodeImageView1 = [[UIImageView alloc]
                            initWithImage:xcodeImage];
    
    self.xcodeImageView2 = [[UIImageView alloc]
                            initWithImage:xcodeImage];
    
    /* Just set the size to make the images smaller */
    [self.xcodeImageView1 setFrame:CGRectMake(0.0f,
                                              0.0f,
                                              100.0f,
                                              100.0f)];
    
    [self.xcodeImageView2 setFrame:[self bottomRightRect]];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.xcodeImageView1];
    [self.view addSubview:self.xcodeImageView2];
    
}

- (void) viewDidAppear:(BOOL)paramAnimated{
    
    [super viewDidAppear:paramAnimated];
    [self startTopLeftImageViewAnimation];
    [self startBottomRightViewAnimationAfterDelay:2.0f];
    
}

@end
