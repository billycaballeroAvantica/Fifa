//
//  PlayerDetailViewController.h
//  Fifa
//
//  Created by Billy.Caballero on 3/17/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "AVTBaseViewController.h"
#import "Player.h"

@interface PlayerDetailViewController : AVTBaseViewController

@property (weak, nonatomic) IBOutlet UIImageView *playerProfileImageView;
@property (weak, nonatomic) IBOutlet UILabel *playerFirstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerLastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerCommonNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerHeightLabel;
@property (weak, nonatomic) IBOutlet UIImageView *playerClubImageView;
@property (weak, nonatomic) IBOutlet UIImageView *playerCountryImageView;
@property (weak, nonatomic) IBOutlet UILabel *playerRatingLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerSkillPaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerSkillShootingLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerSkillPassingLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerSkillDribblingLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerSkillDefendingLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerSkillHeadingLabel;

@property (weak, nonatomic) NSString * playerResourceId;
@property (strong, nonatomic) Player * player;

@end
