//
//  ClubsListViewController.h
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "AVTBaseViewController.h"
#import "PlayerListTableViewController.h"
#import "Club.h"

@interface ClubsListViewController : AVTBaseViewController

@property (weak, nonatomic) PlayerListTableViewController* tableViewController;
@property (strong, nonatomic) Club* club;

@end
