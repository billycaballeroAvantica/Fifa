//
//  FIFABaseAppearanceManager.m
//  Fifa
//
//  Created by Billy.Caballero on 3/23/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FIFABaseAppearanceManager.h"
#import "UIColor+CustomColors.h"

@implementation FIFABaseAppearanceManager

- (void)setAppearance
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTintColor: UIColorFromRGB(0xFFFFFF)];
    [[UINavigationBar appearance] setBarTintColor: UIColorFromRGB(0x39654E)];
    
}

@end
