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

static NSString* const kFifaTopTenSkillCellIdentifier =  @"topTenSkillCellIdentifier";
static NSString* const kFifaTopTenListVCIdentifier =  @"topTenListVCIdentifier";

@implementation TopTenSkillTableViewController

#pragma mark -
#pragma mark Public Methods
#pragma mark -

- (void) viewDidLoad{
    self.skillPlayers = @[@"Pace", @"Dribbling", @"Shooting",
                             @"Defending", @"Heading", @"Passing", @"Height", @"Rating"];
}

#pragma mark -
#pragma mark Delegates
#pragma mark -

#pragma mark - Table Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.skillPlayers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SkillPlayersTableViewCell *cell = (SkillPlayersTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kFifaTopTenSkillCellIdentifier];
    [cell setSkillName: self.skillPlayers[indexPath.row]];
    [cell setSkillImage: [NSString stringWithFormat:@"%ld", (long)indexPath.row + 1]];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

#pragma mark - prepare for segue delegate

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if( [segue.identifier  isEqual: kFifaTopTenListVCIdentifier] ){
        TopTenListViewController *topTenListViewController = segue.destinationViewController;
        topTenListViewController.playerSkill = self.skillPlayers[self.tableView.indexPathForSelectedRow.row];
    }
}

@end
