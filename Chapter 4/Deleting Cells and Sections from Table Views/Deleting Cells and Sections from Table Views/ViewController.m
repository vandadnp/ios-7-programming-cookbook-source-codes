//
//  ViewController.m
//  Deleting Cells and Sections from Table Views
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

static NSString *CellIdentifier = @"NumbersCellIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableViewNumbers;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfNumbers;
@property (nonatomic, strong) UIBarButtonItem *barButtonAction;
@end

static NSString *SectionOddNumbers = @"Odd Numbers";
static NSString *SectionEvenNumbers = @"Even Numbers";

@implementation ViewController

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dictionaryOfNumbers.allKeys.count;
    
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section{

    NSString *sectionNameInDictionary =
        self.dictionaryOfNumbers.allKeys[section];
    
    NSArray *sectionArray = self.dictionaryOfNumbers[sectionNameInDictionary];
    return sectionArray.count;
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                           forIndexPath:indexPath];
    
    NSString *sectionNameInDictionary =
        self.dictionaryOfNumbers.allKeys[indexPath.section];
    
    NSArray *sectionArray = self.dictionaryOfNumbers[sectionNameInDictionary];
    
    NSNumber *number = sectionArray[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%lu",
                             (unsigned long)[number unsignedIntegerValue]];
    
    return cell;
    
}

- (NSString *) tableView:(UITableView *)tableView
 titleForHeaderInSection:(NSInteger)section{
    
    return self.dictionaryOfNumbers.allKeys[section];
    
}

- (NSMutableDictionary *) dictionaryOfNumbers{
    
    if (_dictionaryOfNumbers == nil){
        NSMutableArray *arrayOfEvenNumbers =
        [[NSMutableArray alloc] initWithArray:@[
                                                @0,
                                                @2,
                                                @4,
                                                @6,
                                                ]];
        
        NSMutableArray *arrayOfOddNumbers =
        [[NSMutableArray alloc] initWithArray:@[
                                                @1,
                                                @3,
                                                @5,
                                                @7,
                                                ]];
        
        _dictionaryOfNumbers =
        [[NSMutableDictionary alloc]
         initWithDictionary:@{
                              SectionEvenNumbers : arrayOfEvenNumbers,
                              SectionOddNumbers : arrayOfOddNumbers,
                              }];
        
    }
    return _dictionaryOfNumbers;
}


/* 1 */
//- (void) deleteOddNumbersSection:(id)paramSender{
//    
//    /* First remove the section from our data source */
//    NSString *key = SectionOddNumbers;
//    NSInteger indexForKey = [[self.dictionaryOfNumbers allKeys]
//                             indexOfObject:key];
//    
//    if (indexForKey == NSNotFound){
//        NSLog(@"Could not find the section in the data source.");
//        return;
//    }
//    [self.dictionaryOfNumbers removeObjectForKey:key];
//    
//    /* Then delete the section from the table view */
//    NSIndexSet *sectionToDelete = [NSIndexSet indexSetWithIndex:indexForKey];
//    [self.tableViewNumbers deleteSections:sectionToDelete
//                         withRowAnimation:UITableViewRowAnimationAutomatic];
//    
//    /* Finally, remove the button from the navigation bar
//     as it is not useful any longer */
//    [self.navigationItem setRightBarButtonItem:nil animated:YES];
//    
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    self.barButtonAction =
//    [[UIBarButtonItem alloc]
//     initWithTitle:@"Delete Odd Numbers"
//     style:UIBarButtonItemStylePlain
//     target:self
//     action:@selector(deleteOddNumbersSection:)];
//    
//    [self.navigationItem setRightBarButtonItem:self.barButtonAction
//                                      animated:NO];
//    
//    self.tableViewNumbers = [[UITableView alloc]
//                             initWithFrame:self.view.frame
//                             style:UITableViewStyleGrouped];
//    
//    [self.tableViewNumbers registerClass:[UITableViewCell class]
//                  forCellReuseIdentifier:CellIdentifier];
//    
//    self.tableViewNumbers.autoresizingMask =
//        UIViewAutoresizingFlexibleWidth |
//        UIViewAutoresizingFlexibleHeight;
//    
//    self.tableViewNumbers.delegate = self;
//    self.tableViewNumbers.dataSource = self;
//    
//    [self.view addSubview:self.tableViewNumbers];
//    
//}

/* 2 */
- (void) deleteNumbersGreaterThan2:(id)paramSender{
    
    NSMutableArray *arrayOfIndexPathsToDelete =
        [[NSMutableArray alloc] init];
    
    NSMutableArray *arrayOfNumberObjectsToDelete =
        [[NSMutableArray alloc] init];
    
    /* Step 1: gather the objects we have to delete from our data source
     and their index paths */
    __block NSUInteger keyIndex = 0;
    [self.dictionaryOfNumbers enumerateKeysAndObjectsUsingBlock:
     ^(NSString *key, NSMutableArray *object, BOOL *stop) {
         
         [object enumerateObjectsUsingBlock:
          ^(NSNumber *number, NSUInteger numberIndex, BOOL *stop) {
              
              if ([number unsignedIntegerValue] > 2){
                  
                  NSIndexPath *indexPath =
                  [NSIndexPath indexPathForRow:numberIndex
                                     inSection:keyIndex];
                  
                  [arrayOfIndexPathsToDelete addObject:indexPath];
                  [arrayOfNumberObjectsToDelete addObject:number];
              }
              
          }];
         
         keyIndex++;
     }];
    
    /* Step 2: delete the objects from the data source */
    if ([arrayOfNumberObjectsToDelete count] > 0){
        NSMutableArray *arrayOfOddNumbers =
            self.dictionaryOfNumbers[SectionOddNumbers];
        
        NSMutableArray *arrayOfEvenNumbers =
            self.dictionaryOfNumbers[SectionEvenNumbers];
        
        [arrayOfNumberObjectsToDelete enumerateObjectsUsingBlock:
         ^(NSNumber *numberToDelete, NSUInteger idx, BOOL *stop) {
             if ([arrayOfOddNumbers indexOfObject:numberToDelete]
                    != NSNotFound){
                 [arrayOfOddNumbers removeObject:numberToDelete];
             }
             if ([arrayOfEvenNumbers indexOfObject:numberToDelete]
                    != NSNotFound){
                 [arrayOfEvenNumbers removeObject:numberToDelete];
             }
         }];
    }
    
    /* Step 3: delete the cells that correspond to the objects */
    [self.tableViewNumbers
     deleteRowsAtIndexPaths:arrayOfIndexPathsToDelete
     withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.barButtonAction =
    [[UIBarButtonItem alloc]
     initWithTitle:@"Delete Numbers > 2"
     style:UIBarButtonItemStylePlain
     target:self
     action:@selector(deleteNumbersGreaterThan2:)];
    
    [self.navigationItem setRightBarButtonItem:self.barButtonAction
                                      animated:NO];
    
    self.tableViewNumbers = [[UITableView alloc]
                             initWithFrame:self.view.frame
                             style:UITableViewStyleGrouped];
    
    [self.tableViewNumbers registerClass:[UITableViewCell class]
                  forCellReuseIdentifier:CellIdentifier];
    
    self.tableViewNumbers.autoresizingMask =
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;
    
    self.tableViewNumbers.delegate = self;
    self.tableViewNumbers.dataSource = self;
    
    [self.view addSubview:self.tableViewNumbers];
    
}

@end
