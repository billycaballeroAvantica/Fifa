//
//  PlayerRepository.h
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FifaBaseRepository.h"
#import "Player.h"

@interface PlayerRepository : FifaBaseRepository

+(instancetype)sharedRepository;
-(NSMutableArray *) synchronizePlayers: (id) json context: (NSManagedObjectContext *)ctx;
-(Player *) synchronizePlayer: (id) json context: (NSManagedObjectContext *)ctx;

@end
