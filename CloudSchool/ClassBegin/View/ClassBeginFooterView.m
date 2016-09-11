//
//  ClassBeginFooterView.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/10.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ClassBeginFooterView.h"
#import "MoreClassView.h"
#import "ClassCollectionView.h"
#import "ClassCollectionViewCell.h"
@implementation ClassBeginFooterView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, [[self class] getHeight])];
    if(!self)
    {
        return nil;
    }
    self.backgroundColor = KCOLOR_WHITE;
    
    MoreClassView *moreClassView = [[MoreClassView alloc] init];
    [self addSubview:moreClassView];
    
    ClassCollectionView *classCollectionView = [[ClassCollectionView alloc] initWithFrame:CGRectMake(10,
                                                                                                     moreClassView.bottom,
                                                                                                     SCREEN_WIDTH - 20,
                                                                                                     [ClassCollectionViewCell getHeight])];
    classCollectionView.backgroundColor = KCOLOR_RED;
    [self addSubview:classCollectionView];
    
    return self;
}

+ (CGFloat)getHeight
{
    return 200;
}

@end
