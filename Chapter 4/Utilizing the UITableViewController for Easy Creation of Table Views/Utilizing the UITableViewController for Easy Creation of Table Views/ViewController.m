//
//  ViewController.m
//  Utilizing the UITableViewController for Easy Creation of Table Views
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

static NSString *CellIdentifier = @"Cell";

@interface ViewController ()
@property (nonatomic, strong) NSArray *allItems;
@end

@implementation ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.allItems = @[
                       @"Anthony Robbins",
                       @"Steven Paul Jobs",
                       @"Paul Gilbert",
                       @"Yngwie Malmsteen"
                       ];
        
        [self.tableView registerClass:[UITableViewCell class]
               forCellReuseIdentifier:CellIdentifier];
        
    }
    return self;
}

- (void) viewDidLoad{
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.allItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier
                             forIndexPath:indexPath];
    
    cell.textLabel.text = self.allItems[indexPath.row];
    
    return cell;
}

@end
