//
//  MyCollectCell.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/12.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "MyCollectCell.h"

@implementation MyCollectCell

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
        imageView.backgroundColor = KCOLOR_RED;
        _leftImageView = imageView;
        [self addSubview:imageView];
    }
    if(!_titleLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_leftImageView.right + 15, 10, SCREEN_WIDTH - 130, 16)];
        label.textColor = KCOLOR_Font333333;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontFirst;
        label.text = @"我的收藏";
        label.textAlignment = NSTextAlignmentLeft;
        _titleLabel = label;
        [self addSubview:label];
    }
    if(!_teaherName)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_leftImageView.right+ 15, 10+_titleLabel.bottom, SCREEN_WIDTH - 130, 16)];
        label.textColor = KCOLOR_Font666666;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontSecond;
        label.text = @"张嵩";
        label.textAlignment = NSTextAlignmentLeft;
        _teaherName = label;
        [self addSubview:label];
    }
    if(!_typeLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_leftImageView.right+ 15, [[self class] getHeight] - 25, SCREEN_WIDTH - 130, 16)];
        label.textColor = KCOLOR_Font9ba6c0;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontSecond;
        label.text = @"类型";
        label.textAlignment = NSTextAlignmentLeft;
        _typeLabel = label;
        [self addSubview:label];
    }
    
    if(!_lineView)
    {
        UIView *lineView = [UIView createViewWithFrame:CGRectMake(0, [[self class] getHeight] - 0.5, SCREEN_WIDTH, 0.5)
                                       backgroundColor:KCOLOR_LineColor];
        [self addSubview:lineView];
        _lineView  = lineView;
    }
    return self;
}


+ (CGFloat)getHeight
{
    return 95;
}
@end
