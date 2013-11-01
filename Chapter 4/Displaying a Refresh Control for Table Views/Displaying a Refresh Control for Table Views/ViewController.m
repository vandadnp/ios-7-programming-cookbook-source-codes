//
//  ViewController.m
//  Displaying a Refresh Control for Table Views
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

static NSString *CellIdentifier = @"Cell";

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *allTimes;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation ViewController

- (void) handleRefresh:(id)paramSender{
    
    /* Put a bit of delay between when the refresh control is released
     and when we actually do the refreshing to make the UI look a bit
     smoother than just doing the update without the animation */
    int64_t delayInSeconds = 1.0f;
    dispatch_time_t popTime =
        dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        /* Add the current date to the list of dates that we have
         so that when the table view is refreshed, a new item will appear
         on the screen so that the user will see the difference between
         the before and the after of the refresh */
        [self.allTimes addObject:[NSDate date]];
        
        [self.refreshControl endRefreshing];
        
        NSIndexPath *indexPathOfNewRow =
            [NSIndexPath indexPathForRow:self.allTimes.count-1 inSection:0];
        
        [self.tableView
             insertRowsAtIndexPaths:@[indexPathOfNewRow]
             withRowAnimation:UITableViewRowAnimationAutomatic];
    });
    
}

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        
        [self.tableView registerClass:[UITableViewCell class]
               forCellReuseIdentifier:CellIdentifier];
        
        self.allTimes = [NSMutableArray arrayWithObject:[NSDate date]];
        
        /* Create the refresh control */
        self.refreshControl = [[UIRefreshControl alloc] init];
        self.refreshControl = self.refreshControl;
        [self.refreshControl addTarget:self
                                action:@selector(handleRefresh:)
                      forControlEvents:UIControlEventValueChanged];
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.allTimes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier
                             forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",
                           self.allTimes[indexPath.row]];
    
    return cell;
}

@end
