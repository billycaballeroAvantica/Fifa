//
//  FIFAClubsServiceAgent.h
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FIFABaseServiceAgent.h"
#import "Player.h"

@interface FIFAClubsServiceAgent : FIFABaseServiceAgent


+ (instancetype)sharedAgent;

- (void)requestPlayersWithClubId: (NSString *)clubId
               successCallback:(void (^)(NSMutableArray *players))success
               failureCallback:(void (^)(NSError *error))failure;

@end
