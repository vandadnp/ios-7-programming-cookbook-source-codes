//
//  ViewController.m
//  Creating Custom Table View Cell Accessories
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

static NSString *MyCellIdentifier = @"SimpleCell";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ViewController
    
- (UIView *) superviewOfType:(Class)paramSuperviewClass
                     forView:(UIView *)paramView{
    
    if (paramView.superview != nil){
        if ([paramView.superview isKindOfClass:paramSuperviewClass]){
            return paramView.superview;
        } else {
            return [self superviewOfType:paramSuperviewClass
                                 forView:paramView.superview];
        }
    }
    
    return nil;
    
}

- (void) performExpand:(UIButton *)paramSender{
    
    /* Handle the tap event of the button */
    __unused UITableViewCell *parentCell =
        (UITableViewCell *)[self superviewOfType:[UITableViewCell class]
                                         forView:paramSender];
    
    /* Now do something with the cell if you want to */
    
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier
                                           forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Section %ld, Cell %ld",
                             (long)indexPath.section,
                             (long)indexPath.row];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0.0f, 0.0f, 150.0f, 25.0f);
    
    [button setTitle:@"Expand"
            forState:UIControlStateNormal];
    
    [button addTarget:self
               action:@selector(performExpand:)
     forControlEvents:UIControlEventTouchUpInside];
    
    cell.accessoryView = button;
    
    return cell;
    
}
    
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
    
- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section{
    return 3;
}
    
- (void)viewDidLoad{
    [super viewDidLoad];
    
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
