//
//  TopTenListTableViewCell.h
//  FifaProject
//
//  Created by Billy.Caballero on 3/16/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface PlayerListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *playerProfileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *playerClubImageView;
@property (weak, nonatomic) IBOutlet UIImageView *playerCountryImageView;

-(void) fillCell: (Player *) player;

@end
