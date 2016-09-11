//
//  LiveViewController.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/10.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "LiveViewController.h"
#import "LiveCell.h"
#import "LiveHeadView.h"
#import "LiveDetailViewController.h"
@interface LiveViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIView *liveView;

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"直播";
    [self titleView];
    [self tableView];
    [self liveView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark
#pragma mark ScrollowViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.liveView.hidden = YES;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.liveView.hidden = NO;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{

    
}
#pragma mark
#pragma mark TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [LiveCell getHeight];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[LiveHeadView alloc] init];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LiveHeadView *headView = [[LiveHeadView alloc] init];
    return headView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LiveDetailViewController *vc = [[LiveDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark
#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentity = @"cell";
    LiveCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if(!cell)
    {
        cell = [[LiveCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"hello";

    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
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
- (UIView *)titleView
{
    if(!_titleView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
        view.backgroundColor = KCOLOR_RED;
        _titleView = view;
        self.navigationItem.titleView = view;
    }
    return _titleView;
}
- (UIView *)liveView
{
    if(!_liveView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 200, SCREEN_HEIGHT - 200, 100, 30)];
        view.backgroundColor = KCOLOR_RED;
        _liveView = view;
        [self.view addSubview:view];
    }
    return _liveView;
}
@end
