//
//  FIFATopTenServiceAgent.h
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FIFABaseServiceAgent.h"

@interface FIFATopTenServiceAgent : FIFABaseServiceAgent

+ (instancetype)sharedAgent;

- (void)requestTopTenWithSkill: (NSString *)skill
       successCallback:(void (^)(id translatedObject))success
       failureCallback:(void (^)(NSError *error))failure;

@end
