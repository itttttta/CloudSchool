//
//  HelpCell.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpCell : UITableViewCell
@property (nonatomic, strong) UILabel *questionLabel;
@property (nonatomic, strong) UILabel *answerLabel;

+ (CGFloat)getHeight;
@end
