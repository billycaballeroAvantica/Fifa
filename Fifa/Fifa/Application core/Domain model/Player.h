//
//  Player.h
//  Fifa
//
//  Created by Billy.Caballero on 3/17/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (strong, nonatomic) NSString * resourceId;
@property (strong, nonatomic) NSString * baseId;
@property (strong, nonatomic) NSString * firstName;
@property (strong, nonatomic) NSString * lastName;
@property (strong, nonatomic) NSString * commonName;
@property (strong, nonatomic) NSString * height;
@property (strong, nonatomic) NSString * dateOfBirth;
@property (strong, nonatomic) NSString * foot;
@property (strong, nonatomic) NSString * clubId;
@property (strong, nonatomic) NSString * leagueId;
@property (strong, nonatomic) NSString * nationId;
@property (strong, nonatomic) NSString * rating;
@property (strong, nonatomic) NSString * type;
@property (strong, nonatomic) NSString * edition;
@property (strong, nonatomic) NSString * pace;
@property (strong, nonatomic) NSString * shooting;
@property (strong, nonatomic) NSString * passing;
@property (strong, nonatomic) NSString * dribbling;
@property (strong, nonatomic) NSString * defending;
@property (strong, nonatomic) NSString * heading;

-(id)initWithJson: (id) json;

@end
