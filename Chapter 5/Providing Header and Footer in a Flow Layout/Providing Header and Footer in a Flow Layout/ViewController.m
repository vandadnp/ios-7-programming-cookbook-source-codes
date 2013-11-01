//
//  ViewController.m
//  Providing Header and Footer in a Flow Layout
//
//  Created by Vandad NP on 02/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "Header.h"
#import "Footer.h"

static NSString *kCollectionViewCellIdentifier = @"Cells";
static NSString *kCollectionViewHeaderIdentifier = @"Headers";
static NSString *kCollectionViewFooterIdentifier = @"Footers";

@implementation ViewController

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    
    NSString *reuseIdentifier = kCollectionViewHeaderIdentifier;
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        reuseIdentifier = kCollectionViewFooterIdentifier;
    }
    
    UICollectionReusableView *view =
    [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                       withReuseIdentifier:reuseIdentifier
                                              forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        Header *header = (Header *)view;
        header.label.text = [NSString stringWithFormat:@"Section Header %lu",
                             (unsigned long)indexPath.section + 1];
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        Footer *footer = (Footer *)view;
        
        NSString *title = [NSString stringWithFormat:@"Section Footer %lu",
                           (unsigned long)indexPath.section + 1];
        [footer.button setTitle:title forState:UIControlStateNormal];
        
        
    }
    
    return view;
    
}

- (NSArray *) allImages{
    
    static NSArray *AllSectionImages = nil;
    
    if (AllSectionImages == nil){
        AllSectionImages = @[
                             [UIImage imageNamed:@"1"],
                             [UIImage imageNamed:@"2"],
                             [UIImage imageNamed:@"3"]
                             ];
    }
    
    return AllSectionImages;
    
}

- (UIImage *) randomImage{
    return [self allImages][arc4random_uniform([self allImages].count)];
}

- (instancetype) initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithCollectionViewLayout:layout];
    if (self != nil){
        /* Register the nib with the collection view for easy retrieval */
        UINib *nib = [UINib nibWithNibName:
                      NSStringFromClass([MyCollectionViewCell class])
                                    bundle:[NSBundle mainBundle]];
        
        [self.collectionView registerNib:nib
              forCellWithReuseIdentifier:kCollectionViewCellIdentifier];
        
        /* Register the header's nib */
        UINib *headerNib = [UINib
                            nibWithNibName:NSStringFromClass([Header class])
                            bundle:[NSBundle mainBundle]];
        [self.collectionView registerNib:headerNib
              forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                     withReuseIdentifier:kCollectionViewHeaderIdentifier];
        
        /* Register the footer's nib */
        UINib *footerNib = [UINib
                            nibWithNibName:NSStringFromClass([Footer class])
                            bundle:[NSBundle mainBundle]];
        [self.collectionView registerNib:footerNib
              forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                     withReuseIdentifier:kCollectionViewFooterIdentifier];
        
    }
    return self;
    
}

- (void) viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)numberOfSectionsInCollectionView
:(UICollectionView *)collectionView{
    /* Between 3 to 6 sections */
    return 3 + arc4random_uniform(4);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    /* Each section has between 3 to 6 cells */
    return 3 + arc4random_uniform(4);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCollectionViewCell *cell =
    [collectionView
     dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier
     forIndexPath:indexPath];
    
    cell.imageViewBackgroundImage.image = [self randomImage];
    cell.imageViewBackgroundImage.contentMode = UIViewContentModeScaleAspectFit;
    
    return cell;
    
}

@end
