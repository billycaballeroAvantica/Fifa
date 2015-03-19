//
//  SeccionRepository.h
//  FifaProject
//
//  Created by Billy.Caballero on 3/12/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "AVTBaseRepository.h"
#import "FifaBaseRepository.h"

@interface SessionRepository : FifaBaseRepository

- (void) setCurrentUser: (NSString *)user_name userPassword:(NSString *)password;
- (BOOL) loginValidateFields: (NSString *)user_name userPassword:(NSString *)password;
- (NSString *) getUsername;

+ (instancetype)sharedRepository;

@end