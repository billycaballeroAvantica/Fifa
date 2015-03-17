//
//  TopTenListViewController.h
//  FifaProject
//
//  Created by Billy.Caballero on 3/16/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "AVTBaseViewController.h"
#import "TopTenListTableViewController.h"

@interface TopTenListViewController : AVTBaseViewController

@property (weak, nonatomic) TopTenListTableViewController* tableViewController;
@property (weak, nonatomic) NSString* playerSkill;

@end
