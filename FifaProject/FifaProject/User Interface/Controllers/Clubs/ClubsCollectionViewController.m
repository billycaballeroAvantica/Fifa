//
//  ClubsCollectionViewController.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "ClubsCollectionViewController.h"
#import "ClubsCollectionViewCell.h"

@implementation ClubsCollectionViewController

- (void) viewDidLoad{
    self.clubList = @{  @"Arsenal" : @"arsenal",
                        @"Aston Villa" : @"aston_villa",
                        @"Blackburn Rovers" : @"blackburn_rovers",
                        @"Chelsea" : @"chelsea",
                        @"Everton": @"everton",
                        @"Liverpool": @"liverpool",
                        @"Manchester City": @"manchester_city",
                        @"Manchester United": @"manchester_united",
                        @"Bayern de Munich": @"bayern_munich",
                        @"Juventus": @"juventus" };
}

-(NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[self.clubList allKeys] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ClubsCollectionViewCell *cell = [collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"clubCollectionCellIdentifier"
                                    forIndexPath:indexPath];
    [cell setBackgroundRandom: indexPath.row];
    [cell setSkillName: [self.clubList allKeys][indexPath.row] ];
    [cell setSkillImage: [self.clubList allValues][indexPath.row] ];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(160, 150);
}


@end
