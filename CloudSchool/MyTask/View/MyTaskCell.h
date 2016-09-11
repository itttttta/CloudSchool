//
//  MyTaskCell.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTaskCell : UITableViewCell
@property (nonatomic, strong) UIImageView* iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UIView *lineView;

- (void)refresh:(id)mode title:(NSString *)titleString icon:(NSString *)iconString indexPath:(NSIndexPath *)indexPath;
+ (CGFloat)getHeight;
@end
