//
//  ViewController.m
//  Constructing Headers and Footers in Table Views
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ViewController

- (CGFloat)     tableView:(UITableView *)tableView
 heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0){
        return 30.0f;
    }
    
    return 0.0f;
}

- (CGFloat)     tableView:(UITableView *)tableView
 heightForFooterInSection:(NSInteger)section{
    
    if (section == 0){
        return 30.0f;
    }
    
    return 0.0f;
    
}

/* 1 */
- (UILabel *) newLabelWithTitle:(NSString *)paramTitle{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = paramTitle;
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    return label;
}
//
//- (UIView *)  tableView:(UITableView *)tableView
// viewForHeaderInSection:(NSInteger)section{
//    
//    if (section == 0){
//        return [self newLabelWithTitle:@"Section 1 Header"];
//    }
//    
//    return nil;
//    
//}
//
//- (UIView *)  tableView:(UITableView *)tableView
// viewForFooterInSection:(NSInteger)section{
//    
//    if (section == 0){
//        return [self newLabelWithTitle:@"Section 1 Footer"];
//    }
//    
//    return nil;
//    
//}

/* 2 */
//- (UIView *)  tableView:(UITableView *)tableView
// viewForHeaderInSection:(NSInteger)section{
//    
//    UIView *header = nil;
//    
//    if (section == 0){
//        
//        UILabel *label = [self newLabelWithTitle:@"Section 1 Header"];
//        
//        /* Move the label 10 points to the right */
//        label.frame = CGRectMake(label.frame.origin.x + 10.0f,
//                                 5.0f, /* Go 5 points down in y axis */
//                                 label.frame.size.width,
//                                 label.frame.size.height);
//        
//        /* Give the container view 10 points more in width than our label
//         because the label needs a 10 extra points left-margin */
//        CGRect resultFrame = CGRectMake(0.0f,
//                                        0.0f,
//                                        label.frame.size.width + 10.0f,
//                                        label.frame.size.height);
//        header = [[UIView alloc] initWithFrame:resultFrame];
//        [header addSubview:label];
//        
//    }
//    
//    return header;
//    
//}
//
//- (UIView *)  tableView:(UITableView *)tableView
// viewForFooterInSection:(NSInteger)section{
//    
//    UIView *footer = nil;
//    
//    if (section == 0){
//        
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
//        
//        /* Move the label 10 points to the right */
//        label.frame = CGRectMake(label.frame.origin.x + 10.0f,
//                                 5.0f, /* Go 5 points down in y axis */
//                                 label.frame.size.width,
//                                 label.frame.size.height);
//        
//        /* Give the container view 10 points more in width than our label
//         because the label needs a 10 extra points left-margin */
//        CGRect resultFrame = CGRectMake(0.0f,
//                                        0.0f,
//                                        label.frame.size.width + 10.0f,
//                                        label.frame.size.height);
//        footer = [[UIView alloc] initWithFrame:resultFrame];
//        [footer addSubview:label];
//        
//    }
//    
//    return footer;
//    
//}

/* 3 */
- (NSString *) tableView:(UITableView *)tableView
 titleForHeaderInSection:(NSInteger)section{
    
    if (section == 0){
        return @"Section 1 Header";
    }
    
    return nil;
    
}

- (NSString *) tableView:(UITableView *)tableView
 titleForFooterInSection:(NSInteger)section{
    
    if (section == 0){
        return @"Section 1 Footer";
    }
    
    return nil;
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                           forIndexPath:indexPath];
        
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"Cell %ld",
                             (long)indexPath.row];
    
    return cell;
    
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.myTableView =
    [[UITableView alloc] initWithFrame:self.view.bounds
                                 style:UITableViewStyleGrouped];
    
    [self.myTableView registerClass:[UITableViewCell class]
             forCellReuseIdentifier:CellIdentifier];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.myTableView];
    
}

@end
