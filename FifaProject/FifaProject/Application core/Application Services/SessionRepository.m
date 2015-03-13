//
//  SeccionRepository.m
//  FifaProject
//
//  Created by Billy.Caballero on 3/12/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "SessionRepository.h"
#import "KeychainItemWrapper.h"

@interface SessionRepository ()

@end

@implementation SessionRepository

- (void) setCurrentUser:(NSString *)user_name userPassword:(NSString *)password {
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"FifaAvanticaLogin" accessGroup:nil];
    [keychainItem setObject: user_name forKey:@"userName"];
    [keychainItem setObject: password forKey: @"password"];
}

- (NSString *) getUsername{
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"FifaAvanticaLogin" accessGroup:nil];
    NSString *username = [keychainItem objectForKey: @"userName"];
    return username;
}

- (BOOL) loginValidateFields:(NSString *)user_name userPassword:(NSString *)password{
    return !([user_name isEqualToString:@""] && [password isEqualToString:@""]);
}

@end