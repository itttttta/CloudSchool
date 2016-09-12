//
//  LiveProgressView.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/12.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveProgressView : UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *progressView;



- (instancetype)initWith:(NSString *)titleString target:(NSArray *)targetArray PointArray:(NSArray *)pointArray;
@end
