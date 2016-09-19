//
//  ExamItemHeadView.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/19.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExamItemHeadView : UIView
@property (nonatomic, strong) UILabel *questionLabel ;
@property (nonatomic, strong) UIImageView *imageView;

+ (CGFloat)getHeight;
@end
