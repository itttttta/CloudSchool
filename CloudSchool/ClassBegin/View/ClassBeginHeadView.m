//
//  ClassBeginHeadView.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/10.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ClassBeginHeadView.h"

@implementation ClassBeginHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, [[self class] getHeight])];
    if(!self)
    {
        return nil;
    }
    self.backgroundColor = KTHEME_COLOR;
    return self;
}

+ (CGFloat)getHeight
{
    return 140;
}

@end
