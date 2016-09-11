//
//  MyTaskHeadView.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "MyTaskHeadView.h"

@implementation MyTaskHeadView

- (instancetype)initWithSection:(NSInteger)section
{
    
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, [[self class] getHeight:section])];
    if(!self)
    {
        return nil;
    }
    switch (section) {
        case 0:
        {
            self.backgroundColor = KTHEME_COLOR;
        }
            break;
        case 1:
        {
            self.backgroundColor = KCOLOR_BackGroundColor;
        }
            break;
        default:
            break;
    }
    return self;
}

+ (CGFloat)getHeight:(NSInteger)section
{
    switch (section) {
        case 0:
            return 180;
            break;
        case 1:
            return 20;
            break;
        default:
            break;
    }
    return 180;
}
@end
