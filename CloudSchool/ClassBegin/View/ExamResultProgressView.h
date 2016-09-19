//
//  ExamResultProgressView.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/19.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExamResultProgressView : UIView

/// @brief Width of Progress Bar
@property (nonatomic) IBInspectable CGFloat progressBarWidth;
/// @brief Progress color in Progress Bar
@property (nonatomic) IBInspectable UIColor *progressBarProgressColor;
/// @brief Track color in Progress Bar
@property (nonatomic) IBInspectable UIColor *progressBarTrackColor;

@property (nonatomic, assign)  CGFloat startAngle;

@property (nonatomic, assign) CGFloat progress ;

/// @brief Indicates of there is ongoing animation
@property (nonatomic, readonly) BOOL isAnimating;

/** Used to set progress with animation or without
 
 @param progress progress to be set
 @param animated should control animate progress change or not
 */
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

/** Used to set progress with animation and custom duration
 
 @param progress progress to be set
 @param animated should control animate progress change or not
 @param duration animation duration (default is 0.2f)
 */
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated duration:(CGFloat)duration;

/// Used to stop ongoing animation
- (void)stopAnimation;

@end
