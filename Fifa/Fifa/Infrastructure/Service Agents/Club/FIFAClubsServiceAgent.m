//
//  FIFAClubsServiceAgent.m
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FIFAClubsServiceAgent.h"

@implementation FIFAClubsServiceAgent

- (void)requestPlayersWithClubId:(NSString *)clubId
               successCallback:(void (^)(NSMutableArray *players))success
               failureCallback:(void (^)(NSError *error))failure{
    NSString *urlParams = [[@"club/" stringByAppendingString:clubId] lowercaseString];
    [self callServiceWithURL: urlParams httpMethod:AVTHTTPMethodGET parameters:nil
                 translation:^id(id responseObject) {
                     id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                     NSMutableArray *players = [[NSMutableArray alloc] init];
                     for (id playerJson in json) {
                         Player *player = [[Player alloc] initWithJson:playerJson];
                         [players addObject:player];
                     }
                     return players;
                 } successCallback:^(NSMutableArray *players) {
                     success(players);
                 } failureCallback:^(NSError *error) {
                     failure(error);
                 }];
}


+ (instancetype)sharedAgent
{
    static FIFAClubsServiceAgent *_sharedAgent = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAgent = [[FIFAClubsServiceAgent alloc] initWithBaseUrl];
        _sharedAgent.responseSerializer =  [AFHTTPResponseSerializer serializer];
    });
    
    return _sharedAgent;
}

@end