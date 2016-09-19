//
//  ExamItemCell.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/19.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ExamItemCell.h"

@implementation ExamItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(!self)
    {
        return nil;
    }
    return self;
}

+ (CGFloat)getHeight
{
    return 40;
}
@end
