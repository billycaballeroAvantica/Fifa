//
//  ImageDownloadHelper.h
//  Fifa
//
//  Created by Billy.Caballero on 3/17/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDownloadHelper : NSObject

+(void)fillProfileImage: (UIImageView *) imageProfile url: (NSString *) route;
+(void)fillClubImage: (UIImageView *) imageClub url: (NSString *) route;
+(void)fillCountryImage: (UIImageView *) imageCountry url: (NSString *) route;

@end
