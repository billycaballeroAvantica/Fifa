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

#pragma mark -
#pragma mark Initialization
#pragma mark -

+ (instancetype)sharedRepository
{
    static id _sharedRepository = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedRepository = [[self class] new];
    });
    return _sharedRepository;
}

#pragma mark -
#pragma mark Public Methods
#pragma mark -

#pragma mark save current user

- (void) setCurrentUser:(NSString *)user_name userPassword:(NSString *)password {
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"FifaAvanticaLogin" accessGroup:nil];
    [keychainItem setObject:(__bridge id)(kSecAttrAccessibleWhenUnlocked) forKey:(__bridge id)(kSecAttrAccessible)];
    [keychainItem setObject: user_name forKey:(__bridge id)(kSecAttrAccount)];
    [keychainItem setObject: password forKey:(__bridge id)(kSecValueData)];
}

#pragma mark get user name

- (NSString *) getUsername{
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"FifaAvanticaLogin" accessGroup:nil];
    [keychainItem setObject:(__bridge id)(kSecAttrAccessibleWhenUnlocked) forKey:(__bridge id)(kSecAttrAccessible)];
    NSString *username = [keychainItem objectForKey: (__bridge id)(kSecAttrAccount)];
    return username;
}

#pragma mark validate login

- (BOOL) loginValidateFields:(NSString *)user_name userPassword:(NSString *)password{
    return !([user_name isEqualToString:@""] && [password isEqualToString:@""]);
}

@end