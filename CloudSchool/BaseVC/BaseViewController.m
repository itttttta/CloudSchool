//
//  BaseViewController.m
//  Util
//
//  Created by 汪达 on 16/6/15.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Color.h"

@implementation BaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KCOLOR_WHITE;
    [self applyNormalNavBar];

    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    self.navigationController.navigationBarHidden = NO;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}

-(void)applyNormalNavBar
{
    //设置navigationbar字体
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],
                                                                      NSForegroundColorAttributeName:KCOLOR_Font333333,
                                                                      }];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarTintColor:KCOLOR_WHITE];
    [self.navigationController.navigationBar setTintColor:KTHEME_COLOR];
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:[UIImage imageWithColor:KCOLOR_WHITE size:CGSizeMake(SCREEN_WIDTH , 1)]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    UIView *lineView = [UIView createViewWithFrame:CGRectMake(0, navigationBar.height - 0.5, SCREEN_WIDTH, 0.5)
                                   backgroundColor:KCOLOR_LineColor];
    [navigationBar addSubview:lineView];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    navigationBar.backIndicatorImage = [UIImage imageNamed:@"箭头"];
    navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"箭头"];
    
}
@end
