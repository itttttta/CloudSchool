//
//  LiveDetailFooterView.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/12.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, LiveDetailFooterViewType) {
    //以下是枚举成员
    Live = 0,//直播
    Face = 1,//面授
};
@interface LiveDetailFooterView : UIView
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *lineView1;

@property (nonatomic, strong) UILabel *className;//课程名
@property (nonatomic, strong) UILabel *scoreLabel;//学分
@property (nonatomic, strong) UIButton *examBtn;//考试
@property (nonatomic, strong) UIButton *textBtn;//测评
@property (nonatomic, strong) UIView *progressView;//进度条
@property (nonatomic, strong) UILabel *addressLabel;//地址
@property (nonatomic, strong) UILabel *timeLabel;//时间
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *teacherNameLabel;//名称
@property (nonatomic, strong) UILabel *doctorLabel;//医院
@property (nonatomic, strong) UILabel *targetLabel;//教学目标
@property (nonatomic, strong) UILabel *keyPointLabel;//知识要点

- (instancetype)initWithType:(LiveDetailFooterViewType)type;

+ (CGFloat)getHeight;
@end
