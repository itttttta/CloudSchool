//
//  ExamItemView.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/14.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ExamItemView.h"
#import "ExamItemCell.h"
#import "ExamItemHeadView.h"
@interface ExamItemView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end
@implementation ExamItemView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    if(!self)
    {
        return nil;
    }
    [self tableView];
    [self nextBtn];
    return self;
}
+ (CGFloat)getHeight
{
    return [ExamItemHeadView getHeight]+[ExamItemCell getHeight] *5;
}
+ (CGFloat)getTableViewHeight
{
    return [ExamItemHeadView getHeight]+[ExamItemCell getHeight] *5;
}
#pragma mark
#pragma mark TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [ExamItemHeadView getHeight];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [ExamItemHeadView getHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ExamItemHeadView *headView = [[ExamItemHeadView alloc] init];
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
    ExamItemCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if(!cell)
    {
        cell = [[ExamItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"嗯哼";
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
#pragma mark
#pragma mark btnClick
- (void)bottomBtnClick
{
    if(_delegate)
    {
        [_delegate nextBtnClick];
    }
}

#pragma mark
#pragma mark ViewInit

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.width, [[self class] getTableViewHeight]) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = KCOLOR_WHITE;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
    }
    return _tableView;
}
- (UIButton *)nextBtn
{
    if(!_nextBtn)
    {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.height - 64, SCREEN_WIDTH - 42, 44)];
            btn.backgroundColor = KTHEME_COLOR;
            [btn setTitle:@"下一题" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitleColor:KCOLOR_WHITE forState:UIControlStateNormal];
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            btn.titleLabel.font = KFontFirst;
            btn.layer.cornerRadius = 3.0;
            btn.layer.masksToBounds = YES;
            _nextBtn = btn;
            [self addSubview:_nextBtn];
    }
    return _nextBtn;
}
@end
