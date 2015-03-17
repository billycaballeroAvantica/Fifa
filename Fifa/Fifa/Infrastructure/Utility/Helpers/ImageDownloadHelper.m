//
//  ImageDownloadHelper.m
//  Fifa
//
//  Created by Billy.Caballero on 3/17/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "ImageDownloadHelper.h"
#import <SDWebImage/UIImageView+WebCache.h>

static NSString * const kFIFAPlayerResorces = @"http://cdn.content.easports.com/fifa/fltOnlineAssets/C74DDF38-0B11-49b0-B199-2E2A11D1CC13/2014/fut/items/images/";

static NSString * const kFIFAPlayerProfileBaseUrl = @"players/web/";

static NSString * const kFIFAPlayerClubBaseUrl = @"clubbadges/web/s";

static NSString * const kFIFAPlayerCountryBaseUrl = @"cardflagssmall/web/";

@implementation ImageDownloadHelper

+(void)fillProfileImage:(UIImageView *)imageProfile url:(NSString *)route{
    NSString *stringProfileUrl =  [NSString stringWithFormat:@"%@%@%@.png", kFIFAPlayerResorces, kFIFAPlayerProfileBaseUrl, route];
    [self downloadImage:imageProfile url:[NSURL URLWithString: stringProfileUrl]];
}

+(void)fillClubImage:(UIImageView *)imageClub url:(NSString *)route{
    NSString *stringClubUrl =  [NSString stringWithFormat:@"%@%@%@.png", kFIFAPlayerResorces, kFIFAPlayerClubBaseUrl, route];
    [self downloadImage:imageClub url:[NSURL URLWithString: stringClubUrl]];
}

+(void)fillCountryImage:(UIImageView *)imageCountry url:(NSString *)route{
     NSString *stringCountryUrl =  [NSString stringWithFormat:@"%@%@%@.png", kFIFAPlayerResorces, kFIFAPlayerCountryBaseUrl, route];
    [self downloadImage:imageCountry url:[NSURL URLWithString: stringCountryUrl] ];
}

+(void)downloadImage: (UIImageView *)imageView url: (NSURL *) url{
    [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:url options:0 progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        imageView.image = image;
    }];
}


@end
