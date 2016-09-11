//
//  HelpCell.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "HelpCell.h"

@implementation HelpCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(!self)
    {
        return nil;
    }
    
    if(!_questionLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 20)];
        label.textColor = KCOLOR_Font333333;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontFirst;
        label.text = @"问题";
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        _questionLabel = label;
    }
    if(!_answerLabel)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, _questionLabel.bottom + 5, 100, 20)];
        label.textColor = KCOLOR_Font333333;
        label.backgroundColor = KCOLOR_CLEAR;
        label.font = KFontFirst;
        label.text = @"答案";
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        _answerLabel = label;
    }
    return self;
}
+ (CGFloat)getHeight
{
    return 50;
}

@end
