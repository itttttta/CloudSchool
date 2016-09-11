//
//  LiveCell.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/10.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *departMentLabel;
@property (nonatomic, strong) UILabel *careerLabel;
@property (nonatomic, strong) UILabel *onLineNumberLabel;
@property (nonatomic, strong) UILabel *classLabel;
@property (nonatomic, strong) UIImageView *centerImageView;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *lineView;



+ (CGFloat)getHeight;


@end
