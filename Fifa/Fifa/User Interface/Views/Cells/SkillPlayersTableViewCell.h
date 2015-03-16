//
//  SkillPlayersTableViewCell.h
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillPlayersTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *skill_name_label;
@property (weak, nonatomic) IBOutlet UIImageView *skill_image_imageview;

-(void)setSkillImage: (NSString *)image_name;
-(void)setSkillName: (NSString *)name;

@end
