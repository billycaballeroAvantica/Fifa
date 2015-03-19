//
//  PlayerRepository.m
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "PlayerRepository.h"
#import "ClubRepository.h"

@implementation PlayerRepository

+ (instancetype)sharedRepository
{
    static id _sharedRepository = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedRepository = [[self class] new];
    });
    return _sharedRepository;
}

-(NSMutableArray *) synchronizePlayers: (id) json context:(NSManagedObjectContext *)ctx{
    NSMutableArray *players = [[NSMutableArray alloc] init];
    for (id playerJson in json) {
        [players addObject: [self synchronizePlayer:playerJson context:ctx] ];
    }
    [self saveManagedObjectContext: ctx];
    return players;
}

-(Player *) synchronizePlayer: (id) json context:(NSManagedObjectContext *)ctx{
    
    Player* player;
    NSArray * array = [[PlayerRepository sharedRepository] fetchEntitiesForClass:[Player class] withPredicate: [NSPredicate predicateWithFormat: @" resourceId = %@", json[@"resource_id"]]  inManagedObjectContext: ctx];
    
    if (!array || !array.count){
        player = [self insertManagedObjectOfClass:[Player class] inManagedObjectContext:ctx];
    }else{
        player = array[0];
    }
    player = [player initWithJson:json];
    
    
    NSArray * arrayClubs = [[ClubRepository sharedRepository] fetchEntitiesForClass:[Club class] withPredicate: [NSPredicate predicateWithFormat: @" clubId = %@", player.clubId]  inManagedObjectContext: ctx];
    
    if (!arrayClubs || !arrayClubs.count){
        
    }else{
        Club* club = arrayClubs[0];
        [club addPlayersObject:player];
    }
    return player;
}



@end
