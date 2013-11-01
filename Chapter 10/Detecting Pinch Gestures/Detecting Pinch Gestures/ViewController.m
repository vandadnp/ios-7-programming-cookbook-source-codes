//
//  ViewController.m
//  Detecting Pinch Gestures
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)
    UIPinchGestureRecognizer *pinchGestureRecognizer;
@property (nonatomic, strong) UILabel *myBlackLabel;
@property (nonatomic, unsafe_unretained) CGFloat currentScale;
@end

@implementation ViewController

- (void) handlePinches:(UIPinchGestureRecognizer*)paramSender{
    
    if (paramSender.state == UIGestureRecognizerStateEnded){
        self.currentScale = paramSender.scale;
    } else if (paramSender.state == UIGestureRecognizerStateBegan &&
               self.currentScale != 0.0f){
        paramSender.scale = self.currentScale;
    }
    
    if (paramSender.scale != NAN &&
        paramSender.scale != 0.0){
        paramSender.view.transform =
        CGAffineTransformMakeScale(paramSender.scale,
                                   paramSender.scale);
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect labelRect = CGRectMake(0.0f,     /* X */
                                  0.0f,     /* Y */
                                  200.0f,   /* Width */
                                  200.0f);  /* Height */
    
    self.myBlackLabel = [[UILabel alloc] initWithFrame:labelRect];
    self.myBlackLabel.center = self.view.center;
    self.myBlackLabel.backgroundColor = [UIColor blackColor];
    
    /* Without this line, our pinch gesture recognizer
     will not work */
    self.myBlackLabel.userInteractionEnabled = YES;
    [self.view addSubview:self.myBlackLabel];
    
    /* Create the Pinch Gesture Recognizer */
    self.pinchGestureRecognizer =  [[UIPinchGestureRecognizer alloc]
                                    initWithTarget:self
                                    action:@selector(handlePinches:)];
    
    /* Add this gesture recognizer to our view */
    [self.myBlackLabel 
     addGestureRecognizer:self.pinchGestureRecognizer];
    
}

@end
