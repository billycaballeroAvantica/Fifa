//
//  ClubsCollectionViewCell.h
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClubsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *clubImageView;
@property (weak, nonatomic) IBOutlet UILabel *clubNameLabel;


-(void) setBackgroundRandom: (NSInteger) indexColor;
-(void) setSkillImage: (NSString *)imageName;
-(void) setSkillName: (NSString *)name;

@end
