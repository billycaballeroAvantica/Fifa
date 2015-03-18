//
//  Club.h
//  Fifa
//
//  Created by Billy.Caballero on 3/17/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Club : NSObject

@property (strong, nonatomic) NSString * clubId;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * imageResource;

-(id)initWithJson: (id) json;

@end
