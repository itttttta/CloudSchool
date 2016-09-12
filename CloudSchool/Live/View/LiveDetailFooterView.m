//
//  LiveDetailFooterView.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/12.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "LiveDetailFooterView.h"

@implementation LiveDetailFooterView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(!self)
    {
        return nil;
    }
    self.backgroundColor  = KCOLOR_BackGroundColor;
    if(!_topView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 175)];
        view.backgroundColor = KCOLOR_WHITE;
        _topView = view;
        [self addSubview:_topView];
        
        
        if(!_className)
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(13, 13, SCREEN_WIDTH - 150, 15)];
            label.textColor = KCOLOR_Font333333;
            label.backgroundColor = KCOLOR_WHITE;
            label.font = KFontFirst;
            label.text = @"课程名字";
            label.textAlignment = NSTextAlignmentLeft;
            [self addSubview:label];
            _className = label;
        }
        if(!_scoreLabel)
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(13, _className.bottom + 10, SCREEN_WIDTH - 150, 13)];
            label.textColor = KCOLOR_Font9ba6c0;
            label.backgroundColor = KCOLOR_WHITE;
            label.font = KFontSecond;
            label.text = @"学分";
            label.textAlignment = NSTextAlignmentLeft;
            [self addSubview:label];
            _scoreLabel = label;
        }
        UIView *lineView = [UIView createViewWithFrame:CGRectMake(13, _scoreLabel.bottom + 20, SCREEN_WIDTH - 26, 0.5)
                                       backgroundColor:KCOLOR_LineColor];
        [self addSubview:lineView];
        NSArray *array = [NSArray arrayWithObjects:@"考试",@"测评", nil];
        NSArray *backColor = [NSArray arrayWithObjects:@"#1f88d2",@"#ff8b49", nil];

        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 13 - 10 - 100 + idx *60, 22, 50, 22)];
            btn.backgroundColor = [UIColor colorWithHex:backColor[idx]];
            [btn setTitle:obj forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitleColor:KCOLOR_WHITE forState:UIControlStateNormal];
            btn.tag = idx;
            btn.layer.cornerRadius = 3.0;
            btn.layer.masksToBounds = YES;
            btn.titleLabel.font = KFontThird;
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [self addSubview:btn];
        }];
        
        if(!_progressView)
        {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 65)];
            view.backgroundColor = KCOLOR_RED;
            _progressView = view;
            [self addSubview:_progressView];
        }
        
        if(!_addressLabel)
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(13, _topView.height - 50, SCREEN_WIDTH - 150, 13)];
            label.textColor = KCOLOR_Font9ba6c0;
            label.backgroundColor = KCOLOR_WHITE;
            label.font = KFontSecond;
            label.text = @"地址";
            label.textAlignment = NSTextAlignmentLeft;
            [self.topView addSubview:label];
            _addressLabel = label;
        }
        
        if(!_timeLabel)
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(13, _addressLabel.bottom + 10, SCREEN_WIDTH - 150, 13)];
            label.textColor = KCOLOR_Font9ba6c0;
            label.backgroundColor = KCOLOR_WHITE;
            label.font = KFontSecond;
            label.text = @"时间";
            label.textAlignment = NSTextAlignmentLeft;
            [self.topView addSubview:label];
            _timeLabel = label;
        }
        
        if(!_lineView)
        {
            UIView *lineView = [UIView createViewWithFrame:CGRectMake(0, _topView.bottom, SCREEN_WIDTH, 10)
                                            backgroundColor:KCOLOR_BackGroundColor];
            [self addSubview:lineView];
            _lineView = lineView;
        }
    }
    
    
    if(!_centerView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, _lineView.bottom, SCREEN_WIDTH, 250)];
        view.backgroundColor = KCOLOR_WHITE;
        _centerView = view;
        [self addSubview:_centerView];


        
        if(!_iconImageView)
        {
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, 14, 100, 16)];
            titleLabel.textColor = KCOLOR_Font333333;
            titleLabel.backgroundColor = KCOLOR_CLEAR;
            titleLabel.font = KFontFirst;
            titleLabel.text = @"授课老师";
            titleLabel.textAlignment = NSTextAlignmentLeft;
            [self.centerView addSubview:titleLabel];
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(13, titleLabel.bottom + 10, 50, 50)];
            imageView.backgroundColor = KCOLOR_BackGroundColor;
            imageView.layer.cornerRadius = imageView.width/2.0;
            imageView.layer.masksToBounds = YES;
            [self.centerView addSubview:imageView];
            _iconImageView = imageView;
        }
        if(!_teacherNameLabel)
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.right + 10, _iconImageView.top+5, 100, 16)];
            label.textColor = KCOLOR_Font666666;
            label.backgroundColor = KCOLOR_CLEAR;
            label.font = KFontSecond;
            label.text = @"张三 院长";
            label.textAlignment = NSTextAlignmentLeft;
            [self.centerView addSubview:label];
            _teacherNameLabel = label;
        }
        if(!_doctorLabel)
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.right + 10, _teacherNameLabel.bottom + 7, SCREEN_WIDTH, 13)];
            label.textColor = KCOLOR_Font666666;
            label.backgroundColor = KCOLOR_WHITE;
            label.font = KFontSecond;
            label.text = @"  张三 fdsjlfklsdjflkdsaf院长";
            label.textAlignment = NSTextAlignmentLeft;
            [self.centerView addSubview:label];
            _doctorLabel = label;
        }
        UIView *lineView = [UIView createViewWithFrame:CGRectMake(13,_iconImageView.bottom + 10, SCREEN_WIDTH - 26, 0.5)
                                       backgroundColor:KCOLOR_LineColor];
        [self.centerView addSubview:lineView];
        
        if(!_targetLabel)
        {
            
            UILabel *titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(13, 14 + lineView.bottom, 100, 16)];
            titleLabel1.textColor = KCOLOR_Font333333;
            titleLabel1.backgroundColor = KCOLOR_CLEAR;
            titleLabel1.font = KFontFirst;
            titleLabel1.text = @"教学目标";
            titleLabel1.textAlignment = NSTextAlignmentLeft;
            [self.centerView addSubview:titleLabel1];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(13,titleLabel1.bottom + 10, 100, 16)];
            label.textColor = KCOLOR_Font666666;
            label.backgroundColor = KCOLOR_CLEAR;
            label.font = KFontSecond;
            label.text = @"张三 院长";
            label.textAlignment = NSTextAlignmentLeft;
            [self.centerView addSubview:label];
            _targetLabel = label;
        }
        
        UIView *lineView1 = [UIView createViewWithFrame:CGRectMake(13,_targetLabel.bottom + 25, SCREEN_WIDTH - 26, 0.5)
                                       backgroundColor:KCOLOR_LineColor];
        [self.centerView addSubview:lineView1];
        
        if(!_keyPointLabel)
        {
            UILabel *titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(13, 14 + lineView1.bottom, 100, 16)];
            titleLabel1.textColor = KCOLOR_Font333333;
            titleLabel1.backgroundColor = KCOLOR_CLEAR;
            titleLabel1.font = KFontFirst;
            titleLabel1.text = @"知识要点";
            titleLabel1.textAlignment = NSTextAlignmentLeft;
            [self.centerView addSubview:titleLabel1];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(13,titleLabel1.bottom + 10, 100, 16)];
            label.textColor = KCOLOR_Font666666;
            label.backgroundColor = KCOLOR_CLEAR;
            label.font = KFontSecond;
            label.text = @"张三 院长";
            label.textAlignment = NSTextAlignmentLeft;
            [self.centerView addSubview:label];
            _keyPointLabel = label;
        }
        
        UIView *lineView2 = [UIView createViewWithFrame:CGRectMake(13,_keyPointLabel.bottom + 25, SCREEN_WIDTH - 26, 0.5)
                                        backgroundColor:KCOLOR_LineColor];
        [self.centerView addSubview:lineView2];
        
        if(!_lineView1)
        {
            UIView *lineView1 = [UIView createViewWithFrame:CGRectMake(0, _centerView.bottom, SCREEN_WIDTH, 10)
                                            backgroundColor:KCOLOR_BackGroundColor];
            [self addSubview:lineView1];
            _lineView1 = lineView1;
        }
    }
  
    
    if(!_bottomView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, _lineView1.bottom, SCREEN_WIDTH, 250)];
        view.backgroundColor = KCOLOR_WHITE;
        _bottomView = view;
        [self addSubview:_bottomView];
    }
    return self;
    
}
- (instancetype)initWithType:(LiveDetailFooterViewType)type
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    return self;
}

#pragma mark
#pragma mark otherAction
- (void)btnClick:(UIButton * )sender
{
    if(sender.tag)
    {
        DLog(@"测评");
    }else
    {
        DLog(@"考试");
    }
}
+ (CGFloat)getHeight
{
    return 175 + 10+ 100 + 75 + 75 + 10 + 44;
}

@end
