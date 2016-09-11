//
//  MoreClassView.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/10.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "MoreClassView.h"

@implementation MoreClassView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    if(!self)
    {
        return nil;
    }
    self.backgroundColor = KCOLOR_WHITE;
    UIView *verticalLineView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 4, 20)];
    verticalLineView.backgroundColor = KTHEME_COLOR;
    verticalLineView.layer.cornerRadius = verticalLineView.width/2.0;
    verticalLineView.layer.masksToBounds = YES;
    [self addSubview:verticalLineView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(verticalLineView.right+ 10, 10, 100, 20)];
    label.textColor = KCOLOR_BLACK;
    label.backgroundColor = KCOLOR_CLEAR;
    label.font = KFontFirst;
    label.text = @"课程推荐";
    label.textAlignment = NSTextAlignmentLeft;
    [self addSubview:label];
    
    UILabel *moreLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 100, 10, 100, 20)];
    moreLabel.textColor = KCOLOR_Font9ba6c0;
    moreLabel.backgroundColor = KCOLOR_CLEAR;
    moreLabel.font = KICON_FONT_(11);
    moreLabel.text = @"学更多\U0000e604";
    moreLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:moreLabel];
    
    return self;
    
}

+ (CGFloat)getHeight
{
    return 44;
}

@end
