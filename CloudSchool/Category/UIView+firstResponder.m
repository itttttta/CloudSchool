//
//  UIView+firstResponder
//  Util
//
//  Created by 汪达 on 16/6/15.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "UIView+firstResponder.h"

@implementation UIView (firstResponder)

- (UIView *)findFirstResponder
{
	if ([self isFirstResponder]) {
		return self;
	}
	
	for (UIView *subview in [self subviews]) {
		UIView *firstResponder = [subview findFirstResponder];
		if (nil != firstResponder) {
			return firstResponder;
		}
	}
	
	return nil;
}


@end
