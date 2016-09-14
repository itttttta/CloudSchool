//
//  LiveDetailHeadView.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/12.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectView.h"
#import "LiveDetailFooterView.h"
@interface LiveDetailHeadView : UIView
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) SelectView *seletView;

- (instancetype)initWithType:(LiveDetailFooterViewType)type;
- (void)refresh:(CourseDetail_M *)courseDetail_M;
+ (CGFloat)getHeight;
@end
