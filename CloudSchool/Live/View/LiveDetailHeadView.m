//
//  LiveDetailHeadView.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/12.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "LiveDetailHeadView.h"
#define ImageViewHeight 180 * (SCREEN_WIDTH/320.0)

@implementation LiveDetailHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(!self)
    {
        return nil;
    }
    self.backgroundColor  = KCOLOR_BLACK;
    
    if(!_coverImageView)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ImageViewHeight)];
        imageView.backgroundColor = KCOLOR_BackGroundColor;
        [self addSubview:imageView];
        _coverImageView = imageView;
    }
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"简介",@"相关课程", nil];
    if(!_seletView)
    {
        _seletView = [[SelectView alloc] initWithFrame:CGRectMake(0, _coverImageView.bottom, SCREEN_WIDTH, 36) TitleArrays:titleArray selectedTag:0];
        [self addSubview:_seletView];
    }
    
    return self;
    
}
+ (CGFloat)getHeight
{
    return ImageViewHeight + 36;
}

@end
