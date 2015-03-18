//
//  Player.m
//  Fifa
//
//  Created by Billy.Caballero on 3/17/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "Player.h"

@implementation Player

-(id)initWithJson: (id) json{
    self = [super init];
    self.resourceId = json[@"resource_id"];
    self.baseId = json[@"base_id"];
    self.firstName = json[@"first_name"];
    self.lastName = json[@"last_name"];
    self.commonName = json[@"common_name"];
    self.height = json[@"height"];
    self.dateOfBirth = json[@"dob"];
    self.foot = json[@"foot"];
    self.clubId = json[@"club_id"];
    self.leagueId = json[@"league_id"];
    self.nationId = json[@"nation_id"];
    self.rating = json[@"rating"];
    self.type = json[@"type"];
    self.edition = json[@"edition"];
    self.pace = json[@"attribute1"];
    self.shooting = json[@"attribute2"];
    self.passing = json[@"attribute3"];
    self.dribbling = json[@"attribute4"];
    self.defending = json[@"attribute5"];
    self.heading = json[@"attribute6"];
    return self;
}


@end
