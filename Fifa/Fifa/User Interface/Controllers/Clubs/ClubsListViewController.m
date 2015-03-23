//
//  ClubsListViewController.m
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "ClubsListViewController.h"
#import "FIFAClubsServiceAgent.h"
#import "PlayerRepository.h"

static NSString* const kFifaTableClubListSegueIdentifier =  @"tableClubsListSegueIdentifier";

@implementation ClubsListViewController

#pragma mark -
#pragma mark Public Methods
#pragma mark -

-(void)viewDidLoad{
    [self fillPlayersByClub];
}

#pragma mark - fill players by club

-(void) fillPlayersByClub{
    [[MRProgressOverlayView showOverlayAddedTo:self.view title: @"Loading" mode: MRProgressOverlayViewModeIndeterminate animated:TRUE] setTintColor: [UIColor blackColor]];
    [[FIFAClubsServiceAgent sharedAgent] requestPlayersWithClubId: self.club.clubId successCallback:^(NSMutableArray *players) {
        self.tableViewController.players = players;
        [self.tableViewController.tableView reloadData];
        [MRProgressOverlayView dismissOverlayForView:self.view animated:TRUE];
    } failureCallback:^(NSError *error, NSMutableArray *players) {
        NSLog(@"error %@", error);
        self.tableViewController.players = players;
        [self.tableViewController.tableView reloadData];
        [MRProgressOverlayView dismissOverlayForView:self.view animated:TRUE];
    }];
}

#pragma mark - prepare for segue delegate

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: kFifaTableClubListSegueIdentifier] ){
        PlayerListTableViewController *controller = segue.destinationViewController;
        self.tableViewController = controller;
    }
}


@end
