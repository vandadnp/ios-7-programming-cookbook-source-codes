//
//  MasterViewController.h
//  Presenting Master-Detail Views with UISplitViewController
//
//  Created by Vandad NP on 02/07/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
