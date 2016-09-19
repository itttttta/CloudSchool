//
//  LiveDetailViewController.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "LiveDetailViewController.h"
#import "LiveDetailHeadView.h"
#import "LiveDetailFooterView.h"
#import "ExamViewController.h"
#import "TestViewController.h"
@interface LiveDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,SelectViewDelegate,LiveDetailFooterViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *bottomBtn;
@property (nonatomic, strong) CourseDetail_M *courseDetail_M;
@property (nonatomic, assign) LiveDetailFooterViewType footerViewType;

@end

@implementation LiveDetailViewController
- (instancetype)init
{
    if(!self)
    {
        return nil;
    }
    _footerViewType = Live;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _course_M.courseName?:@"课程详情";
    self.view.backgroundColor = KCOLOR_WHITE;
    

    [self tableView];
    [self bottomBtn];
    [self getAllData];
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
#pragma mark OtherAtiocn
- (void)bottomBtnClick
{
    DLog(@"bottomBtnClick");
}
#pragma mark
#pragma mark LiveDetailFooterViewDelegate
- (void)examBtnClick:(NSInteger)index
{
    if(!index)
    {
        ExamViewController* vc = [[ExamViewController alloc] init];
        vc.courseID = [self.course_M.courseId copy];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        
       TestViewController * vc = [[TestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];

    }
}
#pragma mark
#pragma mark SelectViewDelegate
- (void)selectTopView:(NSInteger)type
{
    if(type)
    {
        _footerViewType = Course;
    }else
    {
        _footerViewType = Live;
    }
    [self.tableView reloadData];
}
#pragma mark
#pragma mark TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return [LiveDetailFooterView getHeight:_footerViewType];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [LiveDetailHeadView getHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    LiveDetailFooterView *footerView = [[LiveDetailFooterView alloc] initWithType:_footerViewType];
    footerView.delegate =self;
    [footerView refresh:_courseDetail_M];
    return footerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    LiveDetailHeadView *headView = [[LiveDetailHeadView alloc] initWithType:_footerViewType];
    headView.seletView.delegate = self;
    [headView refresh:_courseDetail_M];
    return headView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
#pragma mark
#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentity = @"cell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"hello";
    
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
#pragma mark
#pragma mark ViewInit

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT - KNav_Height - 44) style:UITableViewStyleGrouped];
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
- (UIButton *)bottomBtn
{
    if(!_bottomBtn)
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - KNav_Height - 44, SCREEN_WIDTH, 44)];
        btn.backgroundColor = KTHEME_COLOR;
        [btn setTitle:@"报名参见" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:KCOLOR_WHITE forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        btn.titleLabel.font = KFontFirst;
        _bottomBtn = btn;
        [self.view addSubview:_bottomBtn];
    }
    return _bottomBtn;
}
#pragma mark
#pragma mark 
- (void)getAllData
{
    //获取课程详情
    [[NetWorkManager sharedManager] request_DetailCourseBy:self.course_M.courseId andBlock:^(id data, NSError *error) {
        if([data[@"R"] isEqual:@200]){
            _courseDetail_M = [CourseDetail_M mj_objectWithKeyValues:data[@"RD"]];
            [self.tableView reloadData];
        }
        [self.tableView.mj_header endRefreshing];
    }];
}

@end
