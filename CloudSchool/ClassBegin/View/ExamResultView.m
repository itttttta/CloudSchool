//
//  ExamResultView.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/19.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ExamResultView.h"
#import "ExamResultProgressView.h"
@interface ExamResultView()
@property (nonatomic, strong) ExamResultProgressView *progressView;

@end
@implementation ExamResultView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    if(!self)
    {
        return nil;
    }
    
    self.backgroundColor = KCOLOR_BackGroundColor;
    if(!_topView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
        view.backgroundColor = KCOLOR_WHITE;
        _topView = view;
        [self addSubview:_topView];
    }
    if(!_progressView)
    {
        _progressView =[[ExamResultProgressView alloc] initWithFrame:CGRectMake(0, 36.5, 180, 180)];
        _progressView.centerX = self.centerX;
        [self.topView addSubview:_progressView];
        
        [_progressView setProgressBarWidth:(3.0f)];
        [_progressView setBackgroundColor:KCOLOR_WHITE];
        [_progressView setProgressBarProgressColor:KCOLOR_Otherff8b49];
        [_progressView setProgressBarTrackColor:KCOLOR_BackGroundColor];
        [_progressView setProgress:0.2 animated:NO];
    }
    
    if(!_correctLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
        label.textColor = KCOLOR_Font333333;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KSYSTEM_FONT_(28);
        label.text = @"答对12题";
        label.textAlignment = NSTextAlignmentCenter;
        label.centerX = _progressView.centerX;
        label.centerY = _progressView.centerY;
        _correctLabel = label;
        [self.topView addSubview:_correctLabel];
    }
    if(!_resultLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, _progressView.bottom+ 25, SCREEN_WIDTH - 100, 20)];
        label.textColor = KCOLOR_Font333333;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontFirst;
        label.text = @"非常抱歉,考试没有通过!";
        label.textAlignment = NSTextAlignmentCenter;
        label.centerX = _progressView.centerX;
        _correctLabel = label;
        [self.topView addSubview:_correctLabel];
    }
    
    if(!_bottomBtn1)
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.topView.bottom + 35, SCREEN_WIDTH - 42, 44)];
        btn.backgroundColor = KTHEME_COLOR;
        [btn setTitle:@"重考" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(bottomBTnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:KCOLOR_WHITE forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        btn.titleLabel.font = KFontFirst;
        btn.layer.cornerRadius = 3.0;
        btn.layer.masksToBounds = YES;
        _bottomBtn1 = btn;
        [self addSubview:_bottomBtn1];
    }
    
    if(!_bottomBtn2)
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, _bottomBtn1.bottom+ 12, SCREEN_WIDTH - 42, 44)];
        btn.backgroundColor = KTHEME_COLOR;
        [btn setTitle:@"看答案" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(bottomBTnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:KCOLOR_WHITE forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        btn.titleLabel.font = KFontFirst;
        btn.layer.cornerRadius = 3.0;
        btn.layer.masksToBounds = YES;
        _bottomBtn2 = btn;
        [self addSubview:_bottomBtn2];
    }
    
    return self;
}
-(void)refresh:(id)mode
{
    [_progressView setProgressBarProgressColor:KCOLOR_Otherff8b49];
    [_progressView setProgressBarTrackColor:KCOLOR_BackGroundColor];
    [_progressView setProgress:0.2 animated:YES];
}
#pragma mark
#pragma mark otherAtion
- (void)bottomBTnClick:(id)sender
{
    
}

@end
