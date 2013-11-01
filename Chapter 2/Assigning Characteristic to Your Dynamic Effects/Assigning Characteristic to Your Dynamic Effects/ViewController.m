//
//  ViewController.m
//  Assigning Characteristic to Your Dynamic Effects
//
//  Created by Vandad NP on 06/07/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation ViewController

- (UIView *) newViewWithCenter:(CGPoint)paramCenter
               backgroundColor:(UIColor *)paramBackgroundColor{
    
    UIView *newView =
    [[UIView alloc] initWithFrame:
     CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)];
    
    newView.backgroundColor = paramBackgroundColor;
    newView.center = paramCenter;
    
    return newView;
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UIView *topView = [self newViewWithCenter:CGPointMake(100.0f, 0.0f)
                              backgroundColor:[UIColor greenColor]];
    UIView *bottomView = [self newViewWithCenter:CGPointMake(100.0f, 50.0f)
                                 backgroundColor:[UIColor redColor]];
    
    [self.view addSubview:topView];
    [self.view addSubview:bottomView];
    
    self.animator = [[UIDynamicAnimator alloc]
                     initWithReferenceView:self.view];
    
    /* Create gravity */
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]
                                  initWithItems:@[topView, bottomView]];
    [self.animator addBehavior:gravity];
    
    /* Create collision detection */
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]
                                      initWithItems:@[topView, bottomView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    [self.animator addBehavior:collision];
    
    /* Now specify the elasticity of the items */
    UIDynamicItemBehavior *moreElasticItem = [[UIDynamicItemBehavior alloc]
                                              initWithItems:@[bottomView]];
    moreElasticItem.elasticity = 1.0f;
    
    UIDynamicItemBehavior *lessElasticItem = [[UIDynamicItemBehavior alloc]
                                              initWithItems:@[topView]];
    lessElasticItem.elasticity = 0.5f;
    [self.animator addBehavior:moreElasticItem];
    [self.animator addBehavior:lessElasticItem];
    
}

@end
