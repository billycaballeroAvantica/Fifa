//
//  FIFATopTenServiceAgent.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FIFATopTenServiceAgent.h"
#import "AVTBaseServiceAgent.h"
#import "PlayerRepository.h"

@implementation FIFATopTenServiceAgent

#pragma mark -
#pragma mark Initialization
#pragma mark -

+ (instancetype)sharedAgent
{
    static FIFATopTenServiceAgent *_sharedAgent = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAgent = [[FIFATopTenServiceAgent alloc] initWithBaseUrl];
    });
    
    return _sharedAgent;
}

#pragma mark -
#pragma mark Public Methods
#pragma mark -

#pragma mark - request to get list of players by skill

- (void)requestTopTenWithSkill:(NSString *)skill
                    successCallback:(void (^)(NSMutableArray *players))success
                    failureCallback:(void (^)(NSError *error, NSMutableArray *players))failure{
    
    NSManagedObjectContext* managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSString *urlParams = [[@"topten/" stringByAppendingString:skill] lowercaseString];
    
    [self callServiceWithURL: urlParams httpMethod:AVTHTTPMethodGET parameters:nil
                 translation:^id(id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        return [[PlayerRepository sharedRepository] synchronizePlayers:json context:managedObjectContext];
    } successCallback:^(NSMutableArray *players) {
        success(players);
    } failureCallback:^(NSError *error) {
        [FIFAErrors alertViewInternetConnectionWithMessage: error.userInfo[NSLocalizedDescriptionKey]];
        NSMutableArray *players = [[PlayerRepository sharedRepository] playersBySkill:skill context: managedObjectContext];
        failure(error, players);
    }];
}



@end
