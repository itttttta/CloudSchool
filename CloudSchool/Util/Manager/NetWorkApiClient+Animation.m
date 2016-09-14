//
//  NetWorkApiClient+Animation.m
//  doctor
//
//  Created by 汪达 on 15/12/3.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "NetWorkApiClient+Animation.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#define DefaultDelay 1.0
static const void *HttpRequestHUDKey = &HttpRequestHUDKey;
@implementation NetWorkApiClient (Animation)
//@dynamic   HttpRequestHUDKey;

- (MBProgressHUD *)Animation{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setAnimation:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)AnimationShow
{
    if(![self Animation])
    {
        MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        [self setAnimation:HUD];
    }else
    {
        MBProgressHUD *HUD = [self Animation];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:HUD];
        [HUD show:YES];
    }
    
}
- (void)AnimationHidden
{
    MBProgressHUD *hud = [self Animation];
    
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES];
}
- (void)AnimationShowHint:(NSString *)hint
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:DefaultDelay];
}
- (void)AnimationShowHint:(NSString *)hint delay:(NSTimeInterval)delay
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
}
- (void)AnimationShowSuccess:(NSString *)hint
{
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:DefaultDelay];
}
- (void)AnimationShowSuccess:(NSString *)hint delay:(NSTimeInterval)delay
{
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
}
- (void)AnimationShowError:(NSString*)hint
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:DefaultDelay];
}
- (void)AnimationShowError:(NSString*)hint delay:(NSTimeInterval)delay
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
}
@end
