//
//  SkillPlayersTableViewCell.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "SkillPlayersTableViewCell.h"

@implementation SkillPlayersTableViewCell

-(void)setSkillImage:(NSString *)imageName{
    self.skillImageImageview.image = [UIImage imageNamed: imageName];
}

-(void)setSkillName:(NSString *)name{
    self.skillNameLabel.text = name;
   
}

@end
