//
//  TopTenSkillTableViewController.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "TopTenSkillTableViewController.h"
#import "SkillPlayersTableViewCell.h"
#import "TopTenListViewController.h"

@implementation TopTenSkillTableViewController

- (void) viewDidLoad{
    self.skillPlayers = @[@"Pace", @"Dribbling", @"Shooting",
                             @"Defending", @"Heading", @"Passing", @"Height", @"Rating", @"Sales"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.skillPlayers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"topTenSkillCellIdentifier";
    SkillPlayersTableViewCell *cell = (SkillPlayersTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [cell setSkillName: self.skillPlayers[indexPath.row]];
    [cell setSkillImage: [NSString stringWithFormat:@"%ld", (long)indexPath.row + 1]];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if( [segue.identifier  isEqual: @"topTenListVCIdentifier"] ){
        TopTenListViewController *topTenListViewController = segue.destinationViewController;
        topTenListViewController.playerSkill = self.skillPlayers[self.tableView.indexPathForSelectedRow.row];
    }
}

@end
