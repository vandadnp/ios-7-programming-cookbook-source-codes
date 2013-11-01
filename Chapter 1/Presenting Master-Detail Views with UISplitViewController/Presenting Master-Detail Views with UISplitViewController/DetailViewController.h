//
//  DetailViewController.h
//  Presenting Master-Detail Views with UISplitViewController
//
//  Created by Vandad NP on 02/07/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
