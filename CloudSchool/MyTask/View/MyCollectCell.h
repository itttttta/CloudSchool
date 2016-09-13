//
//  MyCollectCell.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/12.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectCell : UITableViewCell
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *titleLabel ;
@property (nonatomic, strong) UILabel *teaherName ;
@property (nonatomic, strong) UILabel *typeLabel ;
@property (nonatomic, strong) UIView *lineView ;
+ (CGFloat)getHeight;
@end
