//
//  NetWorkApiClient+Animation.h
//  doctor
//
//  Created by 汪达 on 15/12/3.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "NetWorkApiClient.h"

@interface NetWorkApiClient (Animation)
/**
 *  MBProgressHUD 分类
 *  MBShow 带关联 全局唯一
 *  其它三种独立 可重复添加
 *  @return
 */
//默认不带字旋转
- (void)AnimationShow;
- (void)AnimationHidden;

//长条 默认显示时间1秒
- (void)AnimationShowHint:(NSString *)hint;
- (void)AnimationShowHint:(NSString *)hint delay:(NSTimeInterval)delay;

//成功 带勾号 默认显示时间1秒
- (void)AnimationShowSuccess:(NSString *)hint;
- (void)AnimationShowSuccess:(NSString *)hint delay:(NSTimeInterval)delay;

//错误 带X号 默认显示时间1秒
- (void)AnimationShowError:(NSString*)hint;
- (void)AnimationShowError:(NSString*)hint delay:(NSTimeInterval)delay;
@end
