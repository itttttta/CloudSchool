//
//  ExamInfoView.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/14.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ExamInfoViewDelegate<NSObject>
- (void)startBtnClick;
@end

@interface ExamInfoView : UIView
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *examNameLabel ;
@property (nonatomic, strong) UILabel *timeLabel ;
@property (nonatomic, strong) UILabel *numberLabel ;
@property (nonatomic, strong) UILabel *qualifiedNumberLabel ;
@property (nonatomic, weak) id<ExamInfoViewDelegate>delegate ;

- (void)refresh:(ExamInfo_M *)examInfo_M;
@end
