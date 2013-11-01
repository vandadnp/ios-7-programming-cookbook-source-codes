//
//  ViewController.m
//  Introduction to Table Views
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

//#import "ViewController.h"
//
//@interface ViewController ()
//@property (nonatomic, strong) UITableView *myTableView;
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    self.myTableView = [[UITableView alloc]
//                        initWithFrame:self.view.bounds
//                        style:UITableViewStylePlain];
//    
//    [self.view addSubview:self.myTableView];
//    
//}
//
//@end

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ViewController
    
- (CGFloat)     tableView:(UITableView *)tableView
  heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.myTableView]){
        return 100.0f;
    }
    return 40.0f;
}
    
- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.myTableView = [[UITableView alloc]
                        initWithFrame:self.view.bounds
                        style:UITableViewStylePlain];
    
    self.myTableView.delegate = self;
    
    [self.view addSubview:self.myTableView];
    
}

@end

