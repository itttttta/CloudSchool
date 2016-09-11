//
//  UIViewController+Swizzle.m
//  Coding_iOS
//
//  Created by 汪达 on 14-8-1.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import "UIViewController+Swizzle.h"
#import "ObjcRuntime.h"
//#import "RDVTabBarController.h"

@implementation UIViewController (Swizzle)
- (void)customViewDidAppear:(BOOL)animated{
    [self customViewDidAppear:animated];
    
}

- (void)customViewWillDisappear:(BOOL)animated{
//    [AVAnalytics endLogPageView:NSStringFromClass([self class])];
//    DLog(@"customViewWillDisappear = : %@", NSStringFromClass([self class]));
    [self customViewWillDisappear:animated];
}

- (void)customviewWillAppear:(BOOL)animated{
    
//    DLog(@"customviewWillAppear =  : %@", NSStringFromClass([self class]));
//    [AVAnalytics beginLogPageView:NSStringFromClass([self class])];
    [self customviewWillAppear:animated];
}

+ (void)load{
    swizzleAllViewController();
}
@end

void swizzleAllViewController()
{
    Swizzle([UIViewController class], @selector(viewDidAppear:), @selector(customViewDidAppear:));
    Swizzle([UIViewController class], @selector(viewWillDisappear:), @selector(customViewWillDisappear:));
    Swizzle([UIViewController class], @selector(viewWillAppear:), @selector(customviewWillAppear:));
}