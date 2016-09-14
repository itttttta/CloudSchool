//
//  SelectView.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/12.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SelectViewDelegate<NSObject>
- (void)selectTopView:(NSInteger)type;
@end

@interface SelectView : UIView
@property (nonatomic, weak) id<SelectViewDelegate>delegate ;
@property (nonatomic, strong) UIView *selectLineView;

- (id)initWithFrame:(CGRect)frame TitleArrays:(NSArray *)titleArray selectedTag:(NSInteger)selectedTag;
@end
