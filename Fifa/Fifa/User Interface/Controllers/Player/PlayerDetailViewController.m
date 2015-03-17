//
//  PlayerDetailViewController.m
//  Fifa
//
//  Created by Billy.Caballero on 3/17/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "PlayerDetailViewController.h"
#import "FIFAPlayerServiceAgent.h"
#import "ImageDownloadHelper.h"

@implementation PlayerDetailViewController

-(void)viewDidLoad{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self requestPlayerInfo];
}

-(void)requestPlayerInfo{
    [[MRProgressOverlayView showOverlayAddedTo:self.view title: @"Loading" mode: MRProgressOverlayViewModeIndeterminate animated:TRUE] setTintColor: [UIColor blackColor]];
    [[FIFAPlayerServiceAgent sharedAgent] requestPlayerWithResourceId: self.playerResourceId successCallback:^(id json) {
        self.playerJson = json;
        [self fillElements];
        [MRProgressOverlayView dismissOverlayForView:self.view animated:TRUE];
    } failureCallback:^(NSError *error) {
        [MRProgressOverlayView dismissOverlayForView:self.view animated:TRUE];
    }];
}

-(void)fillElements{
    [self fillLabels];
    [self fillImages];
}

-(void)fillLabels{
    self.playerFirstNameLabel.text = self.playerJson[@"first_name"];
    self.playerLastNameLabel.text = self.playerJson[@"last_name"];
    self.playerCommonNameLabel.text = [NSString stringWithFormat: @"%@", self.playerJson[@"common_name"]];
    self.playerHeightLabel.text = [NSString stringWithFormat: @"Height : %@cm", self.playerJson[@"height"]];
    self.playerRatingLabel.text = [NSString stringWithFormat: @"Rating : %@", self.playerJson[@"rating"]];
    self.playerSkillPaceLabel.text = [NSString stringWithFormat: @"Pace : %@",self.playerJson[@"attribute1"]];
    self.playerSkillShootingLabel.text = [NSString stringWithFormat: @"Shooting : %@",self.playerJson[@"attribute2"]];
    self.playerSkillPassingLabel.text = [NSString stringWithFormat: @"Passing : %@",self.playerJson[@"attribute3"]];
    self.playerSkillDribblingLabel.text = [NSString stringWithFormat: @"Dribbling : %@",self.playerJson[@"attribute4"]];
    self.playerSkillDefendingLabel.text = [NSString stringWithFormat: @"Defending : %@",self.playerJson[@"attribute5"]];
    self.playerSkillHeadingLabel.text = [NSString stringWithFormat: @"Heading : %@",self.playerJson[@"attribute6"]];
}

-(void)fillImages{
    [ImageDownloadHelper fillProfileImage:self.playerProfileImageView url:self.playerJson[@"base_id"]];
    [ImageDownloadHelper fillClubImage:self.playerClubImageView url:self.playerJson[@"club_id"]];
    [ImageDownloadHelper fillCountryImage:self.playerCountryImageView url:self.playerJson[@"nation_id"]];
}

@end
