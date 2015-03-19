//
//  FIFAPlayerServiceAgent.m
//  Fifa
//
//  Created by Billy.Caballero on 3/17/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FIFAPlayerServiceAgent.h"
#import "PlayerRepository.h"

@implementation FIFAPlayerServiceAgent


-(void)requestPlayerWithResourceId:(NSString *)resourceId successCallback:(void (^)(Player *))success failureCallback:(void (^)(NSError *))failure{
    NSString *urlParams = [[@"player/" stringByAppendingString:resourceId] lowercaseString];
    
    NSManagedObjectContext* managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    [self callServiceWithURL:urlParams httpMethod:AVTHTTPMethodGET parameters:nil translation:^id(id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        Player* player = [[PlayerRepository sharedRepository] synchronizePlayer:json context:managedObjectContext];
        [[PlayerRepository sharedRepository] saveManagedObjectContext:managedObjectContext];
        return player;
    } successCallback:^(Player *player) {
        success(player);
    } failureCallback:^(NSError *error) {
        failure(error);
    }];
}

+ (instancetype)sharedAgent
{
    static FIFAPlayerServiceAgent *_sharedAgent = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAgent = [[FIFAPlayerServiceAgent alloc] initWithBaseUrl];
    });
    
    return _sharedAgent;
}

@end
