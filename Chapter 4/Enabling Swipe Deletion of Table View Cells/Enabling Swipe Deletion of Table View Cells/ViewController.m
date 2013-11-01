//
//  ViewController.m
//  Enabling Swipe Deletion of Table View Cells
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

static NSString *MyCellIdentifier = @"SimpleCells";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *allRows;
@end

@implementation ViewController

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
    
}
    
- (void) setEditing:(BOOL)editing
           animated:(BOOL)animated{
    
    [super setEditing:editing
             animated:animated];
    
    [self.myTableView setEditing:editing
                        animated:animated];
    
    
}
    
- (void)  tableView:(UITableView *)tableView
 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
  forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        /* First remove this object from the source */
        [self.allRows removeObjectAtIndex:indexPath.row];
        
        /* Then remove the associated cell from the Table View */
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationLeft];
        
    }
    
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier
                                           forIndexPath:indexPath];
    
    cell.textLabel.text = self.allRows[indexPath.row];
    
    return cell;
    
}
    
- (NSMutableArray *) allRows{
    if (_allRows == nil){
        const NSUInteger numberOfItems = 10;
        _allRows = [[NSMutableArray alloc] initWithCapacity:numberOfItems];
        
        for (NSUInteger counter = 0;
             counter < numberOfItems;
             counter++){
            
            [_allRows addObject:
             [[NSString alloc] initWithFormat:@"Cell Item At Index of %lu",
              (unsigned long)counter]];
            
        }
    }
    return _allRows;
}
    
- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section{
    
    return [self.allRows count];
    
}
    
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.navigationItem setLeftBarButtonItem:self.editButtonItem
                                     animated:NO];
    
    self.myTableView = [[UITableView alloc]
                        initWithFrame:self.view.bounds
                        style:UITableViewStylePlain];
    
    [self.myTableView registerClass:[UITableViewCell class]
             forCellReuseIdentifier:MyCellIdentifier];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    self.myTableView.autoresizingMask = 
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.myTableView];
    
}
    
@end
