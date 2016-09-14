//
//  SelectView.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/12.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "SelectView.h"

@implementation SelectView

- (id)initWithFrame:(CGRect)frame TitleArrays:(NSArray *)titleArray selectedTag:(NSInteger)selectedTag;
{
    self = [super initWithFrame:frame];
    if(!self)
    {
        return nil;
    }
    [titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton createButtonwithFrame:CGRectMake(idx * frame.size.width/titleArray.count, 0,frame.size.width/titleArray.count, frame.size.height)
                                        backgroundColor:KCOLOR_WHITE
                                             titleColor:KTHEME_COLOR
                                                   font:KFontSecond
                                                  title:obj];
        UIView *lineView = [UIView createViewWithFrame:CGRectMake(0,btn.height - 1, btn.width, 1)
                                       backgroundColor:KCOLOR_CLEAR];
        lineView.centerX = btn.width/2.0;
        [btn addSubview:lineView];
        if(idx == selectedTag)
        {
            lineView.backgroundColor = KTHEME_COLOR;
            _selectLineView = lineView;
        }
        @weakify(self)
        btn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self)
            if( self.delegate)
            {
                [ self.delegate selectTopView:idx];
            }
            if( self.selectLineView != lineView)
            {
                 self.selectLineView.backgroundColor = KCOLOR_CLEAR;
                lineView.backgroundColor = KTHEME_COLOR;
                self.selectLineView = lineView;
            }
            
            return [RACSignal empty];
        }];
        [self addSubview:btn];
    }];
    return self;
}

@end
