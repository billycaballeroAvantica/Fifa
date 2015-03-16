//
//  FIFATopTenServiceAgent.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FIFATopTenServiceAgent.h"
#import "AVTBaseServiceAgent.h"

@implementation FIFATopTenServiceAgent


- (void)requestTopTenWithParameters:(NSDictionary *)params
                    successCallback:(void (^)(id translatedObject))success
                    failureCallback:(void (^)(NSError *error))failure{
    [self callServiceWithURL: @"topten/pace" httpMethod:AVTHTTPMethodGET parameters:params
                 translation:^id(id responseObject) {
        return responseObject;
    } successCallback:^(id translatedObject) {
        id json = [NSJSONSerialization JSONObjectWithData:translatedObject options:0 error:nil];
        success(json);
    } failureCallback:^(NSError *error) {
        failure(error);
    }];
}


+ (instancetype)sharedAgent
{
    static FIFATopTenServiceAgent *_sharedAgent = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAgent = [[FIFATopTenServiceAgent alloc] initWithBaseURL:[NSURL URLWithString: kFIFABaseUrl ]];
        _sharedAgent.responseSerializer =  [AFHTTPResponseSerializer serializer];
    });
    
    return _sharedAgent;
}

@end
