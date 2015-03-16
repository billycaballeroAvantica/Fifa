//
//  ClubsCollectionViewCell.h
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClubsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *club_image_view;
@property (weak, nonatomic) IBOutlet UILabel *club_name_label;


-(void) setBackgroundRandom: (NSInteger) indexColor;
-(void) setSkillImage: (NSString *)image_name;
-(void) setSkillName: (NSString *)name;

@end
