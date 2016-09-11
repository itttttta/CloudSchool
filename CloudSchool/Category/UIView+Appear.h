//
//  UIView+Appear.h
//  Util
//
//  Created by 汪达 on 16/6/15.
//  Copyright © 2016年 wd. All rights reserved.
//
#import <UIKit/UIKit.h>


@interface UIView (Appear)

-(void)appear;

-(void)disappearWithCallback:(SEL)aSelector;

@end
