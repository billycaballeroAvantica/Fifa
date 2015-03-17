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

@implementation TopTenListViewController

- (void) viewDidLoad{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [[MRProgressOverlayView showOverlayAddedTo:self.view title: @"Loading" mode: MRProgressOverlayViewModeIndeterminate animated:TRUE] setTintColor: [UIColor blackColor]];
    [[FIFATopTenServiceAgent sharedAgent] requestTopTenWithSkill: self.playerSkill successCallback:^(id json) {
        self.tableViewController.players = json;
        [self.tableViewController.tableView reloadData];
        [MRProgressOverlayView dismissOverlayForView:self.view animated:TRUE];
    } failureCallback:^(NSError *error) {
        NSLog(@"failure");
        [MRProgressOverlayView dismissOverlayForView:self.view animated:TRUE];
    }];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: @"tableTopTenListSegueIdentifier"] ){
        TopTenListTableViewController *controller = segue.destinationViewController;
        self.tableViewController = controller;
    }
}

@end
