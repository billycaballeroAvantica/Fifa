//
//  TopTenListTableViewCell.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/16/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "TopTenListTableViewCell.h"
#import "ImageDownloadHelper.h"

@implementation TopTenListTableViewCell

-(void) fillCell:(NSString *)playerName profileImage:(NSString *)profileUrl clubImage:(NSString *)clubUrl countryImage:(NSString *)countryUrl{
    self.playerNameLabel.text = playerName;
    [ImageDownloadHelper fillProfileImage:self.playerProfileImageView url:profileUrl];
    [ImageDownloadHelper fillClubImage:self.playerClubImageView url:clubUrl];
    [ImageDownloadHelper fillCountryImage:self.playerCountryImageView url:countryUrl];
}

@end
