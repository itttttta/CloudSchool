//
//  QRCodeViewController.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/10.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "QRCodeViewController.h"

@interface QRCodeViewController ()
@property (nonatomic, strong) UIView *backView;

@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KCOLOR_WHITE;
    self.title = @"我的二维码";
    [self backView];
    
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
#pragma mark ViewInit
- (UIView *)backView
{
    if(!_backView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 50, SCREEN_WIDTH - 40, 380)];
        view.backgroundColor = KCOLOR_RED;
        view.layer.borderColor = KCOLOR_WHITE.CGColor;
        view.layer.borderWidth = 0.5;
        view.layer.cornerRadius = 5.0;
        view.layer.masksToBounds = YES;
        _backView = view;
        [self.view addSubview:_backView];
        
        
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.width, 90)];
        topView.backgroundColor = KCOLOR_WHITE;
        [_backView addSubview:topView];
        
        UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(75, 10, 70, 70)];
        iconImageView.backgroundColor = KCOLOR_RED;
        iconImageView.layer.cornerRadius = iconImageView.width/2.0;
        iconImageView.layer.masksToBounds = YES;
        iconImageView.centerX = topView.centerX;
        [topView addSubview:iconImageView];
        
        
        UIImageView *QRImageView = [[UIImageView alloc] initWithFrame:CGRectMake(75, 30+ topView.bottom, 200, 200)];
        QRImageView.backgroundColor = KCOLOR_WHITE;
        QRImageView.centerX = topView.centerX;
        [_backView addSubview:QRImageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, QRImageView.bottom + 20, 200, 20)];
        label.textColor = KCOLOR_BLACK;
        label.backgroundColor = KCOLOR_WHITE;
        label.font = KSYSTEM_FONT_(15);
        label.text = @"授课老师扫码打分";
        label.centerX = topView.centerX;
        label.textAlignment = NSTextAlignmentCenter;
        [_backView addSubview:label];
    }
    return _backView;
}

@end
