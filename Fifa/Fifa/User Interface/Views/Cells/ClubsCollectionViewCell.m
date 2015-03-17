//
//  ClubsCollectionViewCell.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "ClubsCollectionViewCell.h"
#import "UIColor+CustomColors.h"

@implementation ClubsCollectionViewCell


-(void)setBackgroundRandom: (NSInteger) indexColor{
    NSArray *colorArray = @[ @"0x16a085", @"0xC0392B", @"0xf39c12", @"0xc0392b", @"0x2980b9", @"0x464646", @"0x336699", @"0x8E44AD", @"0x762F35", @"E67E22"];
    NSMutableString *tempHex= colorArray[indexColor];
    unsigned colorInt = 0;
    [[NSScanner scannerWithString:tempHex] scanHexInt:&colorInt];
    self.backgroundColor = UIColorFromRGB(colorInt);
}

-(void)setSkillImage:(NSString *)imageName{
    self.clubImageView.image = [UIImage imageNamed: imageName];
}

-(void)setSkillName:(NSString *)name{
    self.clubNameLabel.text = name;
    
}

@end
