//
//  TopTenListTableViewCell.h
//  FifaProject
//
//  Created by Billy.Caballero on 3/16/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopTenListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *playerProfileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *playerClubImageView;
@property (weak, nonatomic) IBOutlet UIImageView *playerCountryImageView;

-(void) fillCell: (NSString *) playerName profileImage: (NSString *) profileUrl clubImage: (NSString *) clubUrl countryImage: (NSString *) countryUrl;

@end
