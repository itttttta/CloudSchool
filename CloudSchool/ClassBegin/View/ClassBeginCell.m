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
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_leftImageView.right + 10, 10, 100, 16)];
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
    if(!_timeLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_leftImageView.right + 10, [[self class] getHeight] - 30, 100, 16)];
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

+ (CGFloat)getHeight
{
    return 95;
}

@end
