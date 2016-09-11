//
//  MyTaskCell.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "MyTaskCell.h"

@implementation MyTaskCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(!self)
    {
        return nil;
    }
    
    if(!_iconImageView)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 16, 16)];
        imageView.backgroundColor = KCOLOR_RED;
        imageView.centerY = [[self class] getHeight]/2.0;
        _iconImageView = imageView;
        [self addSubview:imageView];
    }
    if(!_titleLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.right + 15, 10, 150, 16)];
        label.textColor = KCOLOR_Font333333;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontFirst;
        label.text = @"嗯哼";
        label.textAlignment = NSTextAlignmentLeft;
        label.centerY = [[self class] getHeight]/2.0;
        _titleLabel = label;
        [self addSubview:label];
    }
    if(!_rightLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 100, 10, 80, 16)];
        label.textColor = KCOLOR_Font666666;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KICON_FONT_(13);
        label.text = @"\U0000e604";
        label.textAlignment = NSTextAlignmentRight;
        label.centerY = [[self class] getHeight]/2.0;
        _rightLabel = label;
        [self addSubview:label];
    }
    if(!_lineView)
    {
        UIView *lineView = [UIView createViewWithFrame:CGRectMake(20, [[self class] getHeight] - 0.5, SCREEN_WIDTH, 0.5)
                                       backgroundColor:KCOLOR_LineColor];
        [self addSubview:lineView];
        _lineView  = lineView;
    }
    return self;
}
- (void)refresh:(id)mode title:(NSString *)titleString icon:(NSString *)iconString indexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row ==2)
    {
        _lineView.frame =CGRectMake(0, [[self class] getHeight] - 0.5, SCREEN_WIDTH, 0.5);
    }else
    {
        _lineView.frame =CGRectMake(20, [[self class] getHeight] - 0.5, SCREEN_WIDTH - 20, 0.5);
    }
    
    _titleLabel.text = titleString;
}
+ (CGFloat)getHeight
{
    return 50;
}
@end
