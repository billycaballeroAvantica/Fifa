//
//  SkillPlayersTableViewCell.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "SkillPlayersTableViewCell.h"

@implementation SkillPlayersTableViewCell

-(void)setSkillImage:(NSString *)image_name{
    self.skill_image_imageview.image = [UIImage imageNamed: image_name];
}

-(void)setSkillName:(NSString *)name{
    self.skill_name_label.text = name;
   
}

@end
