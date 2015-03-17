//
//  FIFAPlayerServiceAgent.h
//  Fifa
//
//  Created by Billy.Caballero on 3/17/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FIFABaseServiceAgent.h"

@interface FIFAPlayerServiceAgent : FIFABaseServiceAgent

+ (instancetype)sharedAgent;

- (void)requestPlayerWithResourceId: (NSString *)resourceId
               successCallback:(void (^)(id translatedObject))success
               failureCallback:(void (^)(NSError *error))failure;

@end
