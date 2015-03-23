//
//  TopTenListViewController.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/16/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "TopTenListViewController.h"
#import "FIFATopTenServiceAgent.h"
#import "UIColor+CustomColors.h"

static NSString* const kFifaTableTopTenListSegueIdentifier =  @"tableTopTenListSegueIdentifier";

@implementation TopTenListViewController

#pragma mark -
#pragma mark Public Methods
#pragma mark -

- (void) viewDidLoad{
    [self requestTopTenList];
}

-(void) requestTopTenList{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [[MRProgressOverlayView showOverlayAddedTo:self.view title: @"Loading" mode: MRProgressOverlayViewModeIndeterminate animated:TRUE] setTintColor: [UIColor blackColor]];
    [[FIFATopTenServiceAgent sharedAgent] requestTopTenWithSkill: self.playerSkill successCallback:^(NSMutableArray *players) {
        self.tableViewController.players = players;
        [self.tableViewController.tableView reloadData];
        [MRProgressOverlayView dismissOverlayForView:self.view animated:TRUE];
    } failureCallback:^(NSError *error, NSMutableArray *players) {
        self.tableViewController.players = players;
        [self.tableViewController.tableView reloadData];
        [MRProgressOverlayView dismissOverlayForView:self.view animated:TRUE];
    }];
}

#pragma mark - prepare for segue delegate

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: kFifaTableTopTenListSegueIdentifier] ){
        PlayerListTableViewController *controller = segue.destinationViewController;
        self.tableViewController = controller;
    }
}

@end
