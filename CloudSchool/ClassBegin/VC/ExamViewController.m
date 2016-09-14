//
//  ExamViewController.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/14.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ExamViewController.h"

@interface ExamViewController ()

@end

@implementation ExamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"在线考试";
    self.view.backgroundColor = KCOLOR_WHITE;
    [self getAllData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getAllData
{
    //获取考试信息
    [[NetWorkManager sharedManager] request_ExamInfoandBlock:^(id data, NSError *error) {
       
    }];
}

@end
