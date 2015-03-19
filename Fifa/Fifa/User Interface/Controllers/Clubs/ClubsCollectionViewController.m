//
//  ClubsCollectionViewController.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "ClubsCollectionViewController.h"
#import "ClubsCollectionViewCell.h"
#import "ClubRepository.h"
#import "ClubsListViewController.h"

@implementation ClubsCollectionViewController

- (void) viewDidLoad{
    self.clubList = [[ClubRepository sharedRepository] clubs];
}

-(NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.clubList count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ClubsCollectionViewCell *cell = [collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"clubCollectionCellIdentifier"
                                    forIndexPath:indexPath];
    [cell setBackgroundRandom: indexPath.row];
    [cell fillElements: self.clubList[indexPath.row]];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(160, 150);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual:  @"clubPlayerListViewControllerIdentifier"]){
        ClubsListViewController* clubListViewController = segue.destinationViewController;
        NSIndexPath* indexPath =  self.collectionView.indexPathsForSelectedItems[0];
        clubListViewController.club = self.clubList[indexPath.row];
    }
}


@end
