//
//  ClubRepository.m
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "ClubRepository.h"
#import "Club.h"

@implementation ClubRepository

#pragma mark -
#pragma mark Initialization
#pragma mark -

+ (instancetype)sharedRepository
{
    static id _sharedRepository = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedRepository = [[self class] new];
    });
    return _sharedRepository;
}

#pragma mark -
#pragma mark Public Methods
#pragma mark -

#pragma mark - fill clubs

-(NSMutableArray *)clubs{
    self.managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSMutableArray *clubs = [[NSMutableArray alloc] init];
    NSArray *json = @[ @{@"club_id": @"1", @"name": @"Arsenal", @"image_resource": @"arsenal"} ,
                       @{@"club_id": @"2", @"name": @"Aston Villa", @"image_resource": @"aston_villa"},
                       @{@"club_id": @"3", @"name": @"Blackburn Rovers", @"image_resource": @"blackburn_rovers"},
                       @{@"club_id": @"5", @"name": @"Chelsea", @"image_resource": @"chelsea"},
                       @{@"club_id": @"7", @"name": @"Everton", @"image_resource": @"everton"},
                       @{@"club_id": @"9", @"name": @"Liverpool", @"image_resource": @"liverpool"},
                       @{@"club_id": @"10", @"name": @"Manchester City", @"image_resource": @"manchester_city"},
                       @{@"club_id": @"11", @"name": @"Manchester United", @"image_resource": @"manchester_united"},
                       @{@"club_id": @"21", @"name": @"Bayern de Múnich", @"image_resource": @"bayern_munich"},
                       @{@"club_id": @"45", @"name": @"Juventus", @"image_resource": @"juventus"}];
    clubs = [self synchronizeClubs:json context:self.managedObjectContext];
    [self saveManagedObjectContext: self.managedObjectContext];
    return clubs;
}

#pragma mark - update clubs

-(NSMutableArray *) synchronizeClubs: (id) json context: (NSManagedObjectContext *)ctx{
    NSMutableArray *clubs = [[NSMutableArray alloc] init];
    for (id clubJson in json) {
        [clubs addObject: [self synchronizeClub:clubJson context:ctx] ];
    }
    [self saveManagedObjectContext: ctx];
    return clubs;
}

#pragma mark - update club

-(Club *) synchronizeClub: (id) json context: (NSManagedObjectContext *)ctx{
    Club* club;
    NSArray * array = [[ClubRepository sharedRepository] fetchEntitiesForClass:[Club class] withPredicate: [NSPredicate predicateWithFormat: @" clubId = %@", json[@"club_id"]]  inManagedObjectContext: ctx];
    
    if (!array || !array.count){
        club = [self insertManagedObjectOfClass:[Club class] inManagedObjectContext:ctx];
    }else{
        club = array[0];
    }
    club = [club initWithJson:json];
    return club;
}



@end
