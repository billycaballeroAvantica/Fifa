//
//  ClubRepository.h
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "AVTBaseRepository.h"

@interface ClubRepository : AVTBaseRepository

-(NSMutableArray *) fillClub;

+ (instancetype)sharedRepository;

@end
