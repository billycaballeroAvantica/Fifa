//
//  TopTenListTableViewController.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/16/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "PlayerListTableViewController.h"
#import "PlayerListTableViewCell.h"
#import "PlayerDetailViewController.h"
#import "UIColor+CustomColors.h"
#import "Player.h"

@implementation PlayerListTableViewController

- (void) viewDidLoad{
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"topTenListCellIdentifier";
    PlayerListTableViewCell *cell = (PlayerListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Player *player = self.players[indexPath.row];
    [cell fillCell: player];
    if (indexPath.row % 2 != 0) {
        [cell setBackgroundColor: UIColorFromRGB(0xC4654E)];
    }else{
        [cell setBackgroundColor: UIColorFromRGB(0x03B54)];
    }
    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: @"playerDetailViewControllerIdentifier"]) {
        PlayerDetailViewController *playerDetailViewController = segue.destinationViewController;
        Player *player = self.players[self.tableView.indexPathForSelectedRow.row];
        playerDetailViewController.playerResourceId = player.resourceId;
    }
}


@end
