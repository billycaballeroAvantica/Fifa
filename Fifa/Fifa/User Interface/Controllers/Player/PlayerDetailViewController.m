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

#pragma mark -
#pragma mark Public Methods
#pragma mark -

-(void)viewDidLoad{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self fillElements];
    [self requestToUpdatePlayerInfo];
}

#pragma mark - request to get player info from web services

-(void)requestToUpdatePlayerInfo{
    [[MRProgressOverlayView showOverlayAddedTo:self.view title: @"Loading" mode: MRProgressOverlayViewModeIndeterminate animated:TRUE] setTintColor: [UIColor blackColor]];
    [[FIFAPlayerServiceAgent sharedAgent] requestPlayerWithResourceId: self.player.resourceId successCallback:^(Player *player) {
        self.player = player;
        [self fillElements];
        [MRProgressOverlayView dismissOverlayForView:self.view animated:TRUE];
    } failureCallback:^(NSError *error) {
        [FIFAErrors alertViewInternetConnectionWithMessage: error.userInfo[NSLocalizedDescriptionKey]];
        [MRProgressOverlayView dismissOverlayForView:self.view animated:TRUE];
    }];
}

-(void)fillElements{
    [self fillLabels];
    [self fillImages];
}

-(void)fillLabels{
    self.playerFirstNameLabel.text = [NSString stringWithFormat: @"%@", self.player.firstName];
    self.playerLastNameLabel.text = [NSString stringWithFormat: @"%@", self.player.lastName];
    self.playerCommonNameLabel.text = [NSString stringWithFormat: @"%@", self.player.commonName];
    self.playerHeightLabel.text = [NSString stringWithFormat: @"%@ : %@cm", AVTLS(@"Height"), self.player.height];
    self.playerRatingLabel.text = [NSString stringWithFormat: @"%@ : %@", AVTLS(@"Rating"), self.player.rating];
    self.playerSkillPaceLabel.text = [NSString stringWithFormat: @"%@ : %@", AVTLS(@"Pace"), self.player.pace];
    self.playerSkillShootingLabel.text = [NSString stringWithFormat: @"%@ : %@", AVTLS(@"Shooting"), self.player.shooting];
    self.playerSkillPassingLabel.text = [NSString stringWithFormat: @"%@ : %@", AVTLS(@"Passing"), self.player.passing];
    self.playerSkillDribblingLabel.text = [NSString stringWithFormat: @"%@ : %@", AVTLS(@"Dribbling"), self.player.dribbling];
    self.playerSkillDefendingLabel.text = [NSString stringWithFormat: @"%@ : %@", AVTLS(@"Defending"), self.player.defending];
    self.playerSkillHeadingLabel.text = [NSString stringWithFormat: @"%@ : %@", AVTLS(@"Heading"), self.player.heading];
}


-(void)fillImages{
    [ImageDownloadHelper fillProfileImage:self.playerProfileImageView url: self.player.baseId];
    [ImageDownloadHelper fillClubImage:self.playerClubImageView url: self.player.clubId];
    [ImageDownloadHelper fillCountryImage:self.playerCountryImageView url: self.player.nationId];
}

@end
