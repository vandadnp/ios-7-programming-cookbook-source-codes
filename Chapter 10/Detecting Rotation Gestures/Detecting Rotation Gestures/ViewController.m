//
//  ViewController.m
//  Detecting Rotation Gestures
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)
    UIRotationGestureRecognizer *rotationGestureRecognizer;

@property (nonatomic, strong)
    UILabel *helloWorldLabel;

/* We can remove the nonatomic and the unsafe_unretained marks from this
 property declaration. On a float value, the compiler will generate both
 these for us automatically */
@property (nonatomic, unsafe_unretained)
    CGFloat rotationAngleInRadians;
@end

@implementation ViewController

- (void) handleRotations:(UIRotationGestureRecognizer *)paramSender{
    
    if (self.helloWorldLabel == nil){
        return;
    }
    
    /* Take the previous rotation and add the current rotation to it */
    self.helloWorldLabel.transform =
    CGAffineTransformMakeRotation(self.rotationAngleInRadians +
                                  paramSender.rotation);
    
    /* At the end of the rotation, keep the angle for later use */
    if (paramSender.state == UIGestureRecognizerStateEnded){
        self.rotationAngleInRadians += paramSender.rotation;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.helloWorldLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.helloWorldLabel.text = @"Hello, World!";
    self.helloWorldLabel.font = [UIFont systemFontOfSize:16.0f];
    [self.helloWorldLabel sizeToFit];
    self.helloWorldLabel.center = self.view.center;
    [self.view addSubview:self.helloWorldLabel];
    
    self.rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc]
                                      initWithTarget:self
                                      action:@selector(handleRotations:)];
    
    [self.view addGestureRecognizer:self.rotationGestureRecognizer];
    
}
@end
