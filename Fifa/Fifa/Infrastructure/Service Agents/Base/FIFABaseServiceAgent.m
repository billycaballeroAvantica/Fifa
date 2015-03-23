//
//  FIFServiceAgentBuilder.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/13/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FIFABaseServiceAgent.h"

static NSString * const kFIFABaseUrl = @"http://tools.fifaguide.com/api/";

@implementation FIFABaseServiceAgent

#pragma mark -
#pragma mark Initialization
#pragma mark -

-(instancetype)initWithBaseUrl{
    self = [super initWithBaseURL: [NSURL URLWithString: kFIFABaseUrl]];
    self.responseSerializer =  [AFHTTPResponseSerializer serializer];
    return self;
}

@end
