//
//  TopTenListTableViewController.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/16/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "TopTenListTableViewController.h"
#import "TopTenListTableViewCell.h"
#import "PlayerDetailViewController.h"
#import "UIColor+CustomColors.h"

@implementation TopTenListTableViewController

- (void) viewDidLoad{
    self.players = @[];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"topTenListCellIdentifier";
    TopTenListTableViewCell *cell = (TopTenListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary *player = self.players[indexPath.row];
    [cell fillCell: player[@"first_name"] profileImage: player[@"base_id"] clubImage: player[@"club_id"] countryImage: player[@"nation_id"]];
    if (indexPath.row % 2 != 0) {
        [cell setBackgroundColor: UIColorFromRGB(0xC4654E)];
    }
    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: @"playerDetailViewControllerIdentifier"]) {
        PlayerDetailViewController *playerDetailViewController = segue.destinationViewController;
        playerDetailViewController.playerResourceId = self.players[self.tableView.indexPathForSelectedRow.row][@"resource_id"];
    }
}


@end
