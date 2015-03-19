//
//  FIFAClubsServiceAgent.m
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FIFAClubsServiceAgent.h"
#import "PlayerRepository.h"

@implementation FIFAClubsServiceAgent

- (void)requestPlayersWithClubId:(NSString *)clubId
               successCallback:(void (^)(NSMutableArray *players))success
               failureCallback:(void (^)(NSError *error, NSMutableArray *players))failure{
    
    NSManagedObjectContext* managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSString *urlParams = [[@"club/" stringByAppendingString:clubId] lowercaseString];
    
    [self callServiceWithURL: urlParams httpMethod:AVTHTTPMethodGET parameters:nil
                 translation:^id(id responseObject) {
                     id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                     return [[PlayerRepository sharedRepository] synchronizePlayers:json context:managedObjectContext];
                 } successCallback:^(NSMutableArray *players) {
                     success(players);
                 } failureCallback:^(NSError *error) {
                     [FIFAErrors alertViewInternetConnectionWithMessage: error.userInfo[NSLocalizedDescriptionKey]];
                     NSMutableArray *players = [[PlayerRepository sharedRepository] playersByClubId:clubId context:managedObjectContext];
                     failure(error, players);
                 }];
}


+ (instancetype)sharedAgent
{
    static FIFAClubsServiceAgent *_sharedAgent = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAgent = [[FIFAClubsServiceAgent alloc] initWithBaseUrl];
    });
    
    return _sharedAgent;
}

@end
