//
//  ClubRepository.h
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "AVTBaseRepository.h"
#import "FifaBaseRepository.h"
#import "Club.h"

@interface ClubRepository : FifaBaseRepository

@property (nonatomic, strong) NSManagedObjectContext  *managedObjectContext;
-(NSMutableArray *) clubs;
-(NSMutableArray *) synchronizeClubs: (id) json context: (NSManagedObjectContext *)ctx;
-(Club *) synchronizeClub: (id) json context: (NSManagedObjectContext *)ctx;
+ (instancetype)sharedRepository;

@end
