//
//  ExamViewController.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/14.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ExamViewController.h"
#import "ExamInfoView.h"
#import "ExamItemView.h"
#import "ExamResultView.h"
@interface ExamViewController ()<ExamInfoViewDelegate>
@property (nonatomic, strong) ExamInfoView *examInfoView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) ExamInfo_M *examInfo_M;
@property (nonatomic, strong) ExamItemView  *examItemView;
@property (nonatomic, strong) ExamResultView *examResultView;

@end

@implementation ExamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"在线考试";
    self.view.backgroundColor = KCOLOR_WHITE;
//    [self examInfoView];
//    [self timeLabel];
//    [self getAllData];
    
    [self examResultView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark
#pragma mark ExamInfoViewDelegate
- (void)startBtnClick
{
    [self timeTool];
    self.examInfoView.hidden = YES;
    [self examItemView];
}
#pragma mark
#pragma mark netWork
- (void)getAllData
{

    @weakify(self)
    [[NetWorkManager sharedManager] request_ExamInfo:self.courseID andBlock:^(id data, NSError *error) {
        @strongify(self)
        if([data[@"R"] isEqual:@200]){
            self.examInfo_M = [ExamInfo_M mj_objectWithKeyValues:data[@"RD"]];
            [self.examInfoView refresh:self.examInfo_M];
            [self getExamList];
        }
    }];
    
}
#pragma mark
#pragma mark 获取考题
- (void)getExamList
{
    @weakify(self)
    [[NetWorkManager sharedManager] request_ExamList:self.courseID testLibID:self.examInfo_M.testLibId andBlock:^(id data, NSError *error) {
        @weakify(self)
        if([data[@"R"] isEqual:@200]){
            
        }
    }];
}

#pragma mark
#pragma mark Viewinit
/**
 *  考试信息
 *
 *  @return view
 */
 - (ExamInfoView *)examInfoView
{
    if(!_examInfoView)
    {
        _examInfoView = [[ExamInfoView alloc] init];
        _examInfoView.delegate  = self;
        [self.view addSubview:_examInfoView];
    }
    return _examInfoView;
}
/**
 *  考题
 *
 *  @return view
 */
- (ExamItemView *)examItemView
{
    if(!_examItemView)
    {
        _examItemView = [[ExamItemView alloc] init];
        [self.view addSubview:_examItemView];
    }
    return _examItemView;
}
/**
 *  考试结果
 *
 *  @return view
 */
- (ExamResultView *)examResultView
{
    if(!_examResultView)
    {
        _examResultView = [[ExamResultView alloc] init];
        [self.view addSubview:_examResultView];
    }
    return _examResultView;
}
- (UILabel *)timeLabel
{
    if(!_timeLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        label.textColor = KTHEME_COLOR;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontSecond;
        label.textAlignment = NSTextAlignmentRight;
        _timeLabel = label;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_timeLabel];
    }
    return _timeLabel;
}
#pragma mark
#pragma mark 倒计时
- (void)timeTool
{
    __block int timeout=[self.examInfo_M.testDuration intValue] *60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
            });
        }else{
            int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%d分%.2d秒",minutes, seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.timeLabel.text =strTime;
                DLog(@"%@",strTime);
            });
            timeout--;
            
        }  
    });  
    dispatch_resume(_timer);
}
@end
