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


- (void)requestTopTenWithSkill:(NSString *)skill
                    successCallback:(void (^)(id translatedObject))success
                    failureCallback:(void (^)(NSError *error))failure{
    NSString *urlParams = [[@"topten/" stringByAppendingString:skill] lowercaseString];
    [self callServiceWithURL: urlParams httpMethod:AVTHTTPMethodGET parameters:nil
                 translation:^id(id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        return json;
    } successCallback:^(id translatedObject) {
        success(translatedObject);
    } failureCallback:^(NSError *error) {
        failure(error);
    }];
}


+ (instancetype)sharedAgent
{
    static FIFATopTenServiceAgent *_sharedAgent = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAgent = [[FIFATopTenServiceAgent alloc] initWithBaseUrl];
        _sharedAgent.responseSerializer =  [AFHTTPResponseSerializer serializer];
    });
    
    return _sharedAgent;
}

@end
