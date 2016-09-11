//
//  LiveCell.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/10.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "LiveCell.h"
#define ImageViewHeight 180 * (SCREEN_WIDTH/320.0)
@implementation LiveCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(!self)
    {
        return nil;
    }
    if(!_topView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 75)];
        view.backgroundColor = KCOLOR_WHITE;
        _topView = view;
        [self addSubview:_topView];
    }
    if(!_iconImageView)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 50, 50)];
        imageView.backgroundColor = KCOLOR_BackGroundColor;
        imageView.layer.cornerRadius = imageView.width/2.0;
        imageView.layer.masksToBounds = YES;
        [self addSubview:imageView];
        _iconImageView = imageView;
    }
    if(!_titleLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.right + 10, 15, 100, 16)];
        label.textColor = KCOLOR_Font333333;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontFirst;
        label.text = @"张三 院长";
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        _titleLabel = label;
    }
    if(!_centerImageView)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _topView.bottom, SCREEN_WIDTH, ImageViewHeight)];
        imageView.backgroundColor = KCOLOR_BackGroundColor;
        [self addSubview:imageView];
        _centerImageView = imageView;
    }
    if(!_classLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, _centerImageView.bottom, SCREEN_WIDTH, 36)];
        label.textColor = KCOLOR_Font333333;
        label.backgroundColor = KCOLOR_WHITE;
        label.font = KFontFirst;
        label.text = @"  张三 fdsjlfklsdjflkdsaf院长";
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        _classLabel = label;
    }
    if(!_lineView)
    {
        UIView *lineView = [UIView createViewWithFrame:CGRectMake(0, [[self class] getHeight] - 5, SCREEN_WIDTH, 5)
                                       backgroundColor:KCOLOR_LineColor];
        [self addSubview:lineView];
        _lineView = lineView;
    }
    
    return self;
}

+ (CGFloat)getHeight
{
    return 75 + 36 + ImageViewHeight + 5;
}
@end
