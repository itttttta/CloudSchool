//
//  LiveProgressView.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/12.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "LiveProgressView.h"
#define progressWitdh SCREEN_WIDTH - 26.0
#define smallProgressWitdh (SCREEN_WIDTH - 26)/4.0

@implementation LiveProgressView

- (instancetype)initWith:(NSString *)titleString target:(NSArray *)targetArray PointArray:(NSArray *)pointArray;
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 65)];
    if(!self)
    {
        return nil;
    }
    
    if(!_titleLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(13, 10, 100, 16)];
        label.textColor = KTHEME_COLOR;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontSecond;
        label.text = @"张三 院长";
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        _titleLabel = label;
    }
    if(!_progressView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(13, _titleLabel.bottom+ 10, SCREEN_WIDTH - 26, 2)];
        view.backgroundColor = KCOLOR_BackGroundColor;
        [self addSubview:view];
        _progressView = view;
        
        CGFloat width = smallProgressWitdh;
        
        [targetArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIView *circleView = [UIView createViewWithFrame:CGRectMake(width-5+_progressView.x + idx * width, 0, 10, 10)
                                           backgroundColor:KTHEME_COLOR];
            circleView.layer.cornerRadius = circleView.width/2.0;
            circleView.layer.masksToBounds = YES;
            circleView.centerY =  _progressView.centerY;
            [self addSubview:circleView];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, circleView.bottom + 5, 40, 13)];
            label.textColor = KCOLOR_Font666666;
            label.backgroundColor = KCOLOR_WHITE;
            label.font = KFontForth;
            label.text = obj;
            label.textAlignment = NSTextAlignmentCenter;
            label.centerX = circleView.centerX;
            [self addSubview:label];
            
            
            UIView *scoreView = [[UIView alloc] initWithFrame:CGRectMake(idx*width, 0, width * [pointArray[idx] floatValue], _progressView.height)];
            scoreView.backgroundColor = KTHEME_COLOR;
            [_progressView addSubview:scoreView];
        }];
    }
    
    return self;
}
@end
