//
//  FeedBackViewController.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) UIButton *submitBtn;

@end

@implementation FeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"一件反馈";
    self.view.backgroundColor = KCOLOR_BackGroundColor;
    [self topView];
    [self centerView];
    [self submitBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
#pragma mark
#pragma mark otherAction
- (void)btnClick
{
    DLog(@"提交");
}

#pragma mark
#pragma mark ViewInit
- (UIView *)topView
{
    if(!_topView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190)];
        view.backgroundColor = KCOLOR_WHITE;
        _topView = view;
        [self.view addSubview:_topView];
    }
    return _topView;
}

- (UIView *)centerView
{
    if(!_centerView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, _topView.bottom + 10, SCREEN_WIDTH, 50)];
        view.backgroundColor = KCOLOR_WHITE;
        _centerView = view;
        [self.view addSubview:_centerView];
    }
    return _centerView;
}
 - (UIButton *)submitBtn

{
    if(!_submitBtn)
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, _centerView.bottom + 30, SCREEN_WIDTH - 30, 40)];
        btn.backgroundColor = KCOLOR_Othere9e9e9;
        [btn setTitle:@"提交" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:KCOLOR_WHITE forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        btn.layer.cornerRadius = 3.0;
        btn.layer.masksToBounds = YES;
        _submitBtn = btn;
        [self.view addSubview:_submitBtn];
    }
    return _submitBtn;
}
@end
