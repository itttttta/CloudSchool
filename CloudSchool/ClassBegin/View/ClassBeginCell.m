//
//  ClassBeginCell.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ClassBeginCell.h"

@implementation ClassBeginCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(!self)
    {
        return nil;
    }
    if(!_leftImageView)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 110, 75)];
        imageView.backgroundColor = KCOLOR_BackGroundColor;
        imageView.centerY = [[self class] getHeight]/2.0;
        [self addSubview:imageView];
        _leftImageView = imageView;
    }
    if(!_titleLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_leftImageView.right + 10, 13, SCREEN_WIDTH - _leftImageView.width - 30, 16)];
        label.textColor = KCOLOR_Font333333;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontFirst;
        label.text = @"我是课程名";
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        _titleLabel = label;
    }
    
    if(!_doctorLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_leftImageView.right + 10, 10 + _titleLabel.bottom, 100, 16)];
        label.textColor = KCOLOR_Font747c8e;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontThird;
        label.text = @"我是医生";
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        _doctorLabel = label;
    }
    if(!_scoreLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH  - 70, 10 + _titleLabel.bottom, 50, 16)];
        label.textColor = KCOLOR_Otherff8b49;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontThird;
        label.text = @"学分";
        label.textAlignment = NSTextAlignmentRight;
        [self addSubview:label];
        _scoreLabel = label;
    }
    
    if(!_timeLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_leftImageView.right + 10, [[self class] getHeight] - 25, 100, 16)];
        label.textColor = KCOLOR_Font747c8e;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontThird;
        label.text = @"我是时间";
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        _timeLabel = label;
    }
    if(!_lineView)
    {
        UIView *lineView = [UIView createViewWithFrame:CGRectMake(0, [[self class] getHeight] - 0.5, SCREEN_WIDTH, 0.5)
                                       backgroundColor:KCOLOR_LineColor];
        [self addSubview:lineView];
        _lineView = lineView;
    }
    
    
    return self;
}
- (void)refresh:(Course_M*)course_M
{
    [_leftImageView imageCacheWithImageView:_leftImageView urlString:course_M.coverUrl];
    _titleLabel.text = course_M.courseName;
    _doctorLabel.text = [NSString stringWithFormat:@"%@/%@",course_M.teacherName,course_M.courseCategory];
    _scoreLabel.text = [NSString stringWithFormat:@"%@学分",course_M.courseCredit];
    if([course_M.alertDays integerValue]>0)
    {
        _timeLabel.text = [NSString stringWithFormat:@"距结束%@天",course_M.alertDays];
    }else
    {
        _timeLabel.text = @"已开课";
    }
}

+ (CGFloat)getHeight
{
    return 95;
}

@end
