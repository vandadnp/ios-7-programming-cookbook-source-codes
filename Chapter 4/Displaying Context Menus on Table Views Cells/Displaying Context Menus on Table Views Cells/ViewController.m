//
//  ViewController.m
//  Displaying Context Menus on Table Views Cells
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ViewController

/* 1 */
//- (BOOL)                tableView:(UITableView *)tableView
//  shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    /* Allow the context menu to be displayed on every cell */
//    return YES;
//    
//}
//
//- (BOOL) tableView:(UITableView *)tableView
//  canPerformAction:(SEL)action
// forRowAtIndexPath:(NSIndexPath *)indexPath
//        withSender:(id)sender{
//    
//    NSLog(@"%@", NSStringFromSelector(action));
//    
//    /* Allow every action for now */
//    return YES;
//}
//
//- (void) tableView:(UITableView *)tableView
//     performAction:(SEL)action
// forRowAtIndexPath:(NSIndexPath *)indexPath
//        withSender:(id)sender{
//    
//    /* Empty for now */
//    
//}

/* 2 */
- (BOOL)                tableView:(UITableView *)tableView
  shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /* Allow the context menu to be displayed on every cell */
    return YES;
    
}

- (BOOL) tableView:(UITableView *)tableView
  canPerformAction:(SEL)action
 forRowAtIndexPath:(NSIndexPath *)indexPath
        withSender:(id)sender{
    
    if (action == @selector(copy:)){
        return YES;
    }
    
    return NO;
}

- (void) tableView:(UITableView *)tableView
     performAction:(SEL)action
 forRowAtIndexPath:(NSIndexPath *)indexPath
        withSender:(id)sender{
    
    if (action == @selector(copy:)){
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
        [pasteBoard setString:cell.textLabel.text];
        
    }
    
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                           forIndexPath:indexPath];
        
    cell.textLabel.text = [[NSString alloc]
                             initWithFormat:@"Section %ld Cell %ld",
                             (long)indexPath.section,
                             (long)indexPath.row];
    
    return cell;
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.myTableView = [[UITableView alloc]
                        initWithFrame:self.view.bounds
                        style:UITableViewStylePlain];
    
    [self.myTableView registerClass:[UITableViewCell class]
             forCellReuseIdentifier:CellIdentifier];
    
    self.myTableView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    [self.view addSubview:self.myTableView];
    
}

@end
