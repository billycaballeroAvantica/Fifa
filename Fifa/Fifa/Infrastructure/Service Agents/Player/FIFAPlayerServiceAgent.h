//
//  FIFAPlayerServiceAgent.h
//  Fifa
//
//  Created by Billy.Caballero on 3/17/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FIFABaseServiceAgent.h"
#import "Player.h"

@interface FIFAPlayerServiceAgent : FIFABaseServiceAgent

+ (instancetype)sharedAgent;

- (void)requestPlayerWithResourceId: (NSString *)resourceId
               successCallback:(void (^)(Player *player))success
               failureCallback:(void (^)(NSError *error))failure;

@end
