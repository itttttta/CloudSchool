//
//  TaskReportViewController.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "TaskReportViewController.h"

@interface TaskReportViewController ()

@end

@implementation TaskReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KCOLOR_WHITE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
