//
//  TopTenListTableViewCell.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/16/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "PlayerListTableViewCell.h"
#import "ImageDownloadHelper.h"

@implementation PlayerListTableViewCell

-(void) fillCell:(Player *)player{
    self.playerNameLabel.text = [NSString stringWithFormat: @"%@", player.firstName];
    [ImageDownloadHelper fillProfileImage:self.playerProfileImageView url: [NSString stringWithFormat: @"%@", player.baseId] ];
    [ImageDownloadHelper fillClubImage:self.playerClubImageView url: [NSString stringWithFormat: @"%@", player.clubId] ];
    [ImageDownloadHelper fillCountryImage:self.playerCountryImageView url: [NSString stringWithFormat: @"%@", player.nationId] ];
}

@end
