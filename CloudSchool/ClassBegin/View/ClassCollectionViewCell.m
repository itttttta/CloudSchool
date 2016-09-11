//
//  ClassCollectionViewCell.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/10.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ClassCollectionViewCell.h"

#define CellWidth  (SCREEN_WIDTH - 25)/2.0
#define ImageViewHeight 87 * (SCREEN_WIDTH/320.0)
#define CellHeight ImageViewHeight+50.0

@implementation ClassCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, CellHeight,CellHeight)];
    if(!self)
    {
        return nil;
    }
    self.backgroundColor = KCOLOR_WHITE;
    
    if(!_imageView)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CellWidth, ImageViewHeight)];
        imageView.backgroundColor = KCOLOR_BackGroundColor;
        _imageView = imageView;
        [self addSubview:imageView];
    }
    if(!_titleLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, _imageView.bottom+ 10, self.width, 30)];
        label.textColor = KCOLOR_Font333333;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontFirst;
        label.text = @"我是标题";
        label.numberOfLines = 2;
        [label sizeToFit];
        label.textAlignment = NSTextAlignmentLeft;
        _titleLabel = label;
        [self addSubview:label];
    }
    if(!_bottomView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, _imageView.height - 20, _imageView.width, 20)];
        view.backgroundColor = KCOLOR_BLACK;
        view.alpha= 0.7;
        _bottomView = view;
        [self.imageView addSubview:_bottomView];
    }
    if(!_doctorLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, _bottomView.width, +_bottomView.height)];
        label.textColor = KCOLOR_WHITE;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontSecond;
        label.text = @"我是医生";
        label.textAlignment = NSTextAlignmentLeft;
        _doctorLabel = label;
        [self.bottomView addSubview:label];
    }
    return self;
}

+ (CGFloat)getHeight
{
    return CellHeight;
}
+ (CGFloat)getWitdh
{
    return CellWidth;
}
@end
