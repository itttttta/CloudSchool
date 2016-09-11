//
//  AppDelegate.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/9.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


+ (instancetype)sharedAppDelegate;

- (void)pushViewController:(UIViewController *)viewController;

@end

