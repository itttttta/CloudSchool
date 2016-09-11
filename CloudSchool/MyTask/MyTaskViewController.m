//
//  MyTaskViewController.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/10.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "MyTaskViewController.h"
#import "TaskReportViewController.h"
#import "LiveRecordViewController.h"
#import "MyCollectViewController.h"
#import "HelpViewController.h"
#import "FeedBackViewController.h"
#import "AbortViewController.h"
#import "MyTaskHeadView.h"
#import "MyTaskCell.h"
@interface MyTaskViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *iconArray;
@property (nonatomic, strong) NSMutableArray *vcArray;

@end

@implementation MyTaskViewController

- (instancetype)init
{
    self = [super init ];
    if(!self)
    {
        return nil;
    }
    _titleArray = [NSMutableArray arrayWithObjects:@"任务报告",@"直播记录",@"我的收藏",@"帮助",@"一件反馈",@"关于" ,nil];
    _iconArray = [NSMutableArray arrayWithObjects:@"任务报告",@"",@"",@"",@"", nil];
    _vcArray = [NSMutableArray arrayWithObjects:
                @"TaskReportViewController",
                @"LiveRecordViewController",
                @"MyCollectViewController",
                @"HelpViewController",
                @"FeedBackViewController",
                @"AbortViewController", nil];


    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的任务";
    [self tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewWillAppear:(BOOL)animated
{
//    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma mark
#pragma mark TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [MyTaskHeadView getHeight:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MyTaskHeadView *headView = [[MyTaskHeadView alloc] initWithSection:section];
    return headView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id vc = [[NSClassFromString(_vcArray[indexPath.row + indexPath.section*3]) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark
#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentity = @"cell";
    MyTaskCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if(!cell)
    {
        cell = [[MyTaskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell refresh:nil title:_titleArray[indexPath.row+ indexPath.section *3] icon:_titleArray[indexPath.row+ indexPath.section *3] indexPath:indexPath];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
#pragma mark
#pragma mark ViewInit

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, KSCREEN_WIDTH, KSCREEN_HEIGHT-KTabBar_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = KCOLOR_BackGroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars=NO;
        self.automaticallyAdjustsScrollViewInsets=NO;
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}


@end
