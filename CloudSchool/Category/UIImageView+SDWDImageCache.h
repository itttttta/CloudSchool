//
//  UIImageView+SDWDImageCache.h
//  HHSD
//
//  Created by 汪达 on 15/10/15.
//  Copyright © 2015年 汪达. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIImageView (SDWDImageCache)
- (void)imageCacheWithImageView:(UIImageView *)imageView urlString:(NSString *)urlString;
- (void)imageCacheWithHeadImageView:(UIImageView *)imageView urlString:(NSString *)urlString render:(int)sex;
@end
