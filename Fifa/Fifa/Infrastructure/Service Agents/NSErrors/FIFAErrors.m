//
//  FIFAErrors.m
//  Fifa
//
//  Created by Billy.Caballero on 3/19/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FIFAErrors.h"
#import "AVTAlertViewFactory.h"

NSString * const kFIFAErrorDomain = @"Fifa";

@implementation FIFAErrors

+(void)alertViewInternetConnectionWithMessage:(NSString *) message{
    UIAlertView* alert= [[AVTAlertViewFactory sharedFactory] alertViewWithTitle: kFIFAErrorDomain andMessage: message];
    [alert show];
}


@end
