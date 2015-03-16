//
//  TopTenListTableViewCell.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/16/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "TopTenListTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

static NSString * const kFIFAPlayerProfileBaseUrl = @"http://cdn.content.easports.com/fifa/fltOnlineAssets/C74DDF38-0B11-49b0-B199-2E2A11D1CC13/2014/fut/items/images/players/web/";

static NSString * const kFIFAPlayerClubBaseUrl = @"http://cdn.content.easports.com/fifa/fltOnlineAssets/C74DDF38-0B11-49b0-B199-2E2A11D1CC13/2014/fut/items/images/clubbadges/web/s";

static NSString * const kFIFAPlayerCountryBaseUrl = @"http://cdn.content.easports.com/fifa/fltOnlineAssets/C74DDF38-0B11-49b0-B199-2E2A11D1CC13/2014/fut/items/images/cardflagssmall/web/";

@implementation TopTenListTableViewCell

-(void) fillCell:(NSString *)playerName profileImage:(NSString *)profileUrl clubImage:(NSString *)clubUrl countryImage:(NSString *)countryUrl{
    self.playerNameLabel.text = playerName;
    NSString *stringProfileUrl =  [NSString stringWithFormat:@"%@%@.png", kFIFAPlayerProfileBaseUrl, profileUrl];
    /*NSString *stringClubUrl =  [NSString stringWithFormat:@"%@%@.png", kFIFAPlayerClubBaseUrl, clubUrl];
    NSString *stringCountryUrl =  [NSString stringWithFormat:@"%@%@.png", kFIFAPlayerCountryBaseUrl, countryUrl];*/
    
    [self.playerProfileImageView setImageWithURL: [NSURL URLWithString: stringProfileUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        self.playerProfileImageView.image = image;
    }];
    
    /*[self.playerProfileImageView setImageWithURL: [NSURL URLWithString: stringClubUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        self.playerClubImageView.image = image;
    }];
    
    [self.playerProfileImageView setImageWithURL: [NSURL URLWithString: stringCountryUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        self.playerCountryImageView.image = image;
    }];*/
    
}

@end
