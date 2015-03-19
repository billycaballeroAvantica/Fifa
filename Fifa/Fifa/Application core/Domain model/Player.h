//
//  Player.h
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Club;

@interface Player : NSManagedObject

@property (nonatomic, retain) NSString * resourceId;
@property (nonatomic, retain) NSString * baseId;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * commonName;
@property (nonatomic, retain) NSString * height;
@property (nonatomic, retain) NSString * dateOfBirth;
@property (nonatomic, retain) NSString * foot;
@property (nonatomic, retain) NSString * clubId;
@property (nonatomic, retain) NSString * leagueId;
@property (nonatomic, retain) NSString * nationId;
@property (nonatomic, retain) NSString * rating;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * edition;
@property (nonatomic, retain) NSString * pace;
@property (nonatomic, retain) NSString * shooting;
@property (nonatomic, retain) NSString * passing;
@property (nonatomic, retain) NSString * dribbling;
@property (nonatomic, retain) NSString * defending;
@property (nonatomic, retain) NSString * heading;
@property (nonatomic, retain) Club *club;

-(id)initWithJson: (id) json;


@end
