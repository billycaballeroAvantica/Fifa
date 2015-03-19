//
//  Player.m
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "Player.h"
#import "Club.h"

@implementation Player

@dynamic resourceId;
@dynamic baseId;
@dynamic firstName;
@dynamic lastName;
@dynamic commonName;
@dynamic height;
@dynamic dateOfBirth;
@dynamic foot;
@dynamic clubId;
@dynamic leagueId;
@dynamic nationId;
@dynamic rating;
@dynamic type;
@dynamic edition;
@dynamic pace;
@dynamic shooting;
@dynamic passing;
@dynamic dribbling;
@dynamic defending;
@dynamic heading;
@dynamic club;

-(id)initWithJson: (id) json{
    self.resourceId = json[@"resource_id"];
    self.baseId = json[@"base_id"];
    self.firstName = [NSString stringWithFormat: @"%@", json[@"first_name"] ];
    self.lastName = [NSString stringWithFormat: @"%@", json[@"last_name"] ];
    self.commonName = [NSString stringWithFormat: @"%@", json[@"common_name"] ];
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
