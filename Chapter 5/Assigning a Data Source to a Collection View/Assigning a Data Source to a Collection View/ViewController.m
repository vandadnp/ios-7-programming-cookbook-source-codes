//
//  ViewController.m
//  Assigning a Data Source to a Collection View
//
//  Created by Vandad NP on 02/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

/* For now, we won't return any sections */
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return 0;
}

/* We don't yet know how we can return cells to the collection view so
 let's return nil for now */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

@end
