//
//  ClassBeginViewController.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/10.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ClassBeginViewController.h"
#import "ClassBeginHeadView.h"
#import "ClassBeginFooterView.h"
#import "QRCodeViewController.h"
#import "ClassBeginCell.h"
#import "LiveDetailViewController.h"
@interface ClassBeginViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) Course_M_List *course_M_List;

@end

@implementation ClassBeginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"上课啦";
    [self tableView];
    [self getAllData];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getAllData];
    }];

    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark
#pragma mark TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [ClassBeginCell getHeight];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return [ClassBeginFooterView getHeight];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [ClassBeginHeadView getHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[ClassBeginFooterView alloc] init];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ClassBeginHeadView *headView = [[ClassBeginHeadView alloc] init];
    __weak typeof(self) weakSelf = self;
    [headView bk_whenTapped:^{
        QRCodeViewController *vc = [[QRCodeViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    return headView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LiveDetailViewController *vc = [[LiveDetailViewController alloc] init];
    vc.course_M = self.course_M_List.selectCourses[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark
#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentity = @"cell";
    ClassBeginCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if(!cell)
    {
        cell = [[ClassBeginCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell refresh:_course_M_List.selectCourses[indexPath.row]];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _course_M_List.selectCourses.count;
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
        _tableView.backgroundColor = KCOLOR_WHITE;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars=NO;
        self.automaticallyAdjustsScrollViewInsets=NO;
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}
#pragma mark
#pragma mark getAllData
- (void)getAllData
{
    //获取课程列表
    [[NetWorkManager sharedManager] request_MyCourseListandBlock:^(id data, NSError *error) {
        if([data[@"R"] isEqual:@200]){
            _course_M_List = [Course_M_List mj_objectWithKeyValues:data[@"RD"]];
            [self.tableView reloadData];
        }
        [self.tableView.mj_header endRefreshing];
    }];
    
    //获取推荐课程
    [[NetWorkManager sharedManager] request_RecomendCoursesLandBlock:^(id data, NSError *error) {
        if([data[@"R"] isEqual:@200]){
            [self.tableView reloadData];
        }
        [self.tableView.mj_header endRefreshing];
    }];
}
@end



