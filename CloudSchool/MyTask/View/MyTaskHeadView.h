//
//  MyTaskHeadView.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTaskHeadView : UIView
/**
 *  Init
 *
 *  @param section secion
 *
 *  @return view
 */
- (instancetype)initWithSection:(NSInteger)section;

/**
 *  height
 *
 *  @param section section
 *
 *  @return self height
 */
+ (CGFloat)getHeight:(NSInteger)section;
@end
