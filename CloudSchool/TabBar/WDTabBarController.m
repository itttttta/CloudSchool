//
//  WDTabBarController.m
//  Util
//
//  Created by 汪达 on 16/6/15.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "WDTabBarController.h"
#import "BaseViewController.h"
#import "BaseNavViewController.h"
#import "ClassBeginViewController.h"
#import "LiveViewController.h"
#import "MyTaskViewController.h"
@interface WDTabBarController ()

/**
 *  设置之前选中的按钮
 */
@property (nonatomic, weak) UIButton *selectedBtn;
@property (nonatomic, strong) NSMutableArray *vcArray;
@property (nonatomic, strong) UIAlertView *alertView;

@property (nonatomic,assign) NSInteger sessionUnreadCount;

@property (nonatomic,assign) NSInteger systemUnreadCount;

@property (nonatomic,assign) NSInteger customSystemUnreadCount;

@end

@implementation WDTabBarController


- (instancetype)init
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    _vcArray = [NSMutableArray array];
    [self tabBarVCInit];
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark
#pragma mark TabbarInit
- (void)tabBarVCInit
{
    NSArray *vcStringArray = [NSArray arrayWithObjects:@"ClassBeginViewController",@"LiveViewController",@"MyTaskViewController", nil];
    NSArray *titleArray = [NSArray arrayWithObjects:@"上课啦",@"直播",@"我的任务", nil];
    NSArray *imageArray = [NSArray arrayWithObjects:@"上课啦",@"直播",@"我的任务", nil];
    [self setTabBarWithVCArray:vcStringArray titleArray:titleArray imageArray:imageArray];
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
//    self.title = viewController.title;
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

- (void)setTabBarWithVCArray:(NSArray *)VCarray titleArray:(NSArray *)titleArray imageArray:(NSArray *)imageArray
{
    [VCarray enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL *  stop) {
        BaseViewController  *vc = [[NSClassFromString(obj) alloc] init];
        BaseNavViewController *naVC =  [[BaseNavViewController alloc] initWithRootViewController:vc];
        naVC.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArray[idx]]];
        naVC.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageArray[idx]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        naVC.tabBarItem.title = @"";
//
//        [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(-1, -2)];
//        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
//        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
//        [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
        [self.vcArray addObject:naVC];
    }];
    self.viewControllers = self.vcArray;
    UITabBar *tabBar = self.tabBar;
    [tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *  obj, NSUInteger idx, BOOL * stop) {
        obj.title = titleArray[idx];
    }];
}

@end
