//
//  DashBoardViewController.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "DashBoardViewController.h"

@implementation DashBoardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpElements];
}

- (void)setUpElements{
    self.username_label.text = self.name_current_user;
}

@end
