//
//  TableViewController.m
//  Adding Background Fetch Capabilities to Your Apps
//
//  Created by Vandad NP on 30/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "TableViewController.h"
#import "AppDelegate.h"
#import "NewsItem.h"

@interface TableViewController ()
@property (nonatomic, weak) NSArray *allNewsItems;
@property (nonatomic, unsafe_unretained) BOOL mustReloadView;
@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.allNewsItems = appDelegate.allNewsItems;
    
    [appDelegate addObserver:self
                  forKeyPath:@"allNewsItems"
                     options:NSKeyValueObservingOptionNew
                     context:NULL];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleAppIsBroughtToForeground:)
     name:UIApplicationWillEnterForegroundNotification
     object:nil];
}

- (void) observeValueForKeyPath:(NSString *)keyPath
                       ofObject:(id)object
                         change:(NSDictionary *)change
                        context:(void *)context{
    
    if ([keyPath isEqualToString:@"allNewsItems"]){
        if ([self isBeingPresented]){
            [self.tableView reloadData];
        } else {
            self.mustReloadView = YES;
        }
    }
    
}

- (void) handleAppIsBroughtToForeground:(NSNotification *)paramNotification{
    if (self.mustReloadView){
        self.mustReloadView = NO;
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.allNewsItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier
                             forIndexPath:indexPath];
    
    NewsItem *newsItem = self.allNewsItems[indexPath.row];
    
    cell.textLabel.text = newsItem.text;
    
    return cell;
}

- (void) dealloc{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate removeObserver:self forKeyPath:@"allNewsItems"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
