//
//  ViewController.m
//  Populating a Table View with Data
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

static NSString *TableViewCellIdentifier = @"MyCells";

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if ([tableView isEqual:self.myTableView]){
        return 3;
    }
    
    return 0;
    
}
    
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    
    if ([tableView isEqual:self.myTableView]){
        switch (section){
            case 0:{
                return 3;
                break;
            }
            case 1:{
                return 5;
                break;
            }
            case 2:{
                return 8;
                break;
            }
        }
    }
    
    return 0;
    
}

- (UITableViewCell *)     tableView:(UITableView *)tableView
              cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    
    if ([tableView isEqual:self.myTableView]){
        
        cell = [tableView
                  dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                  forIndexPath:indexPath];
        
        cell.textLabel.text = [NSString stringWithFormat:
                                 @"Section %ld, Cell %ld",
                                 (long)indexPath.section,
                                 (long)indexPath.row];
        
    }
    
    return cell;
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.myTableView =
    [[UITableView alloc] initWithFrame:self.view.bounds
                                 style:UITableViewStylePlain];
    
    [self.myTableView registerClass:[UITableViewCell class]
             forCellReuseIdentifier:TableViewCellIdentifier];
    
    self.myTableView.dataSource = self;
    
    /* Make sure our table view resizes correctly */
    self.myTableView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.myTableView];
    
}

@end
