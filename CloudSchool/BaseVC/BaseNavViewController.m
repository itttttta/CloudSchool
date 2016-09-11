//
//  BaseNavViewController.m
//  Util
//
//  Created by 汪达 on 16/6/15.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()<UINavigationControllerDelegate>

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
    if([viewController isEqual:self.viewControllers[0]])
    {
        viewController.hidesBottomBarWhenPushed = NO;
    }else
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
}
@end
