//
//  Club.m
//  Fifa
//
//  Created by Billy.Caballero on 3/17/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "Club.h"

@implementation Club

-(id)initWithJson: (id) json{
    self = [super init];
    self.clubId = json[@"club_id"];
    self.name = json[@"name"];
    self.imageResource = json[@"image_resource"];
    return self;
}

@end
