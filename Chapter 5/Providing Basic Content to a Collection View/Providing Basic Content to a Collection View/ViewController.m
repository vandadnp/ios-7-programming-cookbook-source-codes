//
//  ViewController.m
//  Providing a Flow Layout to a Collection View
//
//  Created by Vandad NP on 02/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

static NSString *kCollectionViewCellIdentifier = @"Cells";

@implementation ViewController

- (NSArray *) allSectionColors{
    
    static NSArray *allSectionColors = nil;
    
    if (allSectionColors == nil){
        allSectionColors = @[
                             [UIColor redColor],
                             [UIColor greenColor],
                             [UIColor blueColor],
                             ];
    }
    
    return allSectionColors;
    
}

- (instancetype) initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithCollectionViewLayout:layout];
    if (self != nil){
        /* Register the cell with the collection view for easy retrieval */
        [self.collectionView registerClass:[UICollectionViewCell class]
                forCellWithReuseIdentifier:kCollectionViewCellIdentifier];
    }
    return self;
    
}

- (void) viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)numberOfSectionsInCollectionView
            :(UICollectionView *)collectionView{
    return [self allSectionColors].count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    /* Generate between 20 to 40 cells for each section */
    return 20 + arc4random_uniform(21);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell =
    [collectionView
     dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier
     forIndexPath:indexPath];
    
    cell.backgroundColor = [self allSectionColors][indexPath.section];
    
    return cell;
    
}

@end
