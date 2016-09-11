//
//  ClassCollectionViewCell.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/10.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface ClassCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel ;
@property (nonatomic, strong) UIView *rightLineView ;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UILabel *doctorLabel;

+ (CGFloat)getHeight;
+ (CGFloat)getWitdh;
@end
