//
//  TopTenListViewController.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/16/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "TopTenListViewController.h"
#import "FIFATopTenServiceAgent.h"


@implementation TopTenListViewController

- (void) viewDidLoad{
    [[FIFATopTenServiceAgent sharedAgent] requestTopTenWithParameters: nil successCallback:^(id json) {
        self.tableViewController.players = json;
        self.tableViewController.tableView.reloadData;
    } failureCallback:^(NSError *error) {
        NSLog(@"failure");
    }];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: @"tableTopTenListSegueIdentifier"] ){
        TopTenListTableViewController *controller = segue.destinationViewController;
        self.tableViewController = controller;
    }
}

@end
