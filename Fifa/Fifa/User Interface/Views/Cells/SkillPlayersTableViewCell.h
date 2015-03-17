//
//  SkillPlayersTableViewCell.h
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillPlayersTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *skillNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *skillImageImageview;

-(void)setSkillImage: (NSString *)imageName;
-(void)setSkillName: (NSString *)name;

@end
