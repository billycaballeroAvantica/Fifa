//
//  Club.m
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "Club.h"

@implementation Club

@dynamic clubId;
@dynamic name;
@dynamic resourceId;
@dynamic players;

-(id)initWithJson: (id) json{
    self.clubId = json[@"club_id"];
    self.name = json[@"name"];
    self.resourceId = json[@"image_resource"];
    return self;
}


@end
