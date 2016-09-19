//
//  ExamItemView.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/14.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ExamItemViewDelegate<NSObject>
- (void)nextBtnClick;
- (void)proviousBtnClick;
@end

@interface ExamItemView : UIView
@property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, weak) id<ExamItemViewDelegate>delegate ;

@end
