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

@implementation ClubsListViewController

-(void)viewDidLoad{
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

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: @"tableClubsListSegueIdentifier"] ){
        PlayerListTableViewController *controller = segue.destinationViewController;
        self.tableViewController = controller;
    }
}


@end
