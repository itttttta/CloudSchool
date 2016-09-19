//
//  UIImageView+SDWDImageCache.m
//  HHSD
//
//  Created by 汪达 on 15/10/15.
//  Copyright © 2015年 汪达. All rights reserved.
//

#import "UIImageView+SDWDImageCache.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation UIImageView (SDWDImageCache)
- (void)imageCacheWithImageView:(UIImageView *)imageView urlString:(NSString *)urlString
{
    if(urlString && [urlString isKindOfClass:[NSString class]])
    {
        if([urlString hasPrefix:@"http"])
        {
            [imageView sd_setImageWithURL:[NSURL URLWithString:urlString]
                placeholderImage:nil];
            
        }
    }
}
- (void)imageCacheWithHeadImageView:(UIImageView *)imageView urlString:(NSString *)urlString render:(int)sex
{
    if(urlString && [urlString isKindOfClass:[NSString class]])
    {
        if(sex)
        {
            if([urlString hasPrefix:@"http"])
            {
                imageView.image =  nil;
                [imageView sd_setImageWithURL:[NSURL URLWithString:urlString]
                             placeholderImage:nil];
            }
            
        }else
        {
            if([urlString hasPrefix:@"http"])
            {
                [imageView sd_setImageWithURL:[NSURL URLWithString:urlString]
                             placeholderImage:nil];
            }
        }
      
    }
}
@end
