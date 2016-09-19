//
//  ExamInfoView.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/14.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ExamInfoView.h"
@interface ExamInfoView()
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIButton *startBtn;

@end
@implementation ExamInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    if(!self)
    {
        return nil;
    }
    
    self.backgroundColor = KCOLOR_BackGroundColor;
    if(!_topView)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 50, SCREEN_WIDTH - 40, 270)];
        view.backgroundColor = KCOLOR_WHITE;
        _topView = view;
        view.layer.cornerRadius = 5.0;
        view.layer.masksToBounds = YES;
        [self addSubview:_topView];
        
        UIView *topBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width,90 )];
        topBackView.backgroundColor = KTHEME_COLOR;
        [_topView addSubview:topBackView];
        
        if(_iconImageView)
        {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 70, 75)];
            imageView.backgroundColor = KTHEME_COLOR;
            imageView.layer.cornerRadius = imageView.width/2.0;
            imageView.layer.masksToBounds = YES;
            imageView.centerX = self.width/2.0;
            _iconImageView = imageView;
            [self.topView addSubview:imageView];
        }
        
        NSArray *array = [NSArray arrayWithObjects:@"考试科目", @"考试时常",@"考试题目",@"合格题数",nil];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(21, 25 + idx *40 + topBackView.height, 100, 15)];
            label.textColor = KCOLOR_Font333333;
            label.backgroundColor = KCOLOR_WHITE;
            label.font = KFontSecond;
            label.text = obj ;
            label.textAlignment = NSTextAlignmentLeft;
            [label sizeToFit];
            [self.topView addSubview:label];
            
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20 + label.right, 25 + idx *40 + topBackView.height, 100, 15)];
            label1.textColor = KCOLOR_Font666666;
            label1.backgroundColor = KCOLOR_WHITE;
            label1.font = KFontSecond;
            label1.text = @"嗯哼";
            label1.textAlignment = NSTextAlignmentLeft;
            [self.topView addSubview:label1];
            switch (idx) {
                case 0:
                {
                    _examNameLabel = label1;
                }
                    break;
                case 1:
                {
                    _timeLabel = label1;
                }
                    break;
                case 2:
                {
                    _numberLabel = label1;
                }
                    break;
                case 3:
                {
                    _qualifiedNumberLabel = label1;
                }
                    break;
                    
                    
                default:
                    break;
            }
            
        }];
        
        if(!_startBtn)
        {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.topView.bottom + 35, SCREEN_WIDTH - 42, 44)];
            btn.backgroundColor = KTHEME_COLOR;
            [btn setTitle:@"开始考试" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitleColor:KCOLOR_WHITE forState:UIControlStateNormal];
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            btn.titleLabel.font = KFontFirst;
            btn.layer.cornerRadius = 3.0;
            btn.layer.masksToBounds = YES;
            _startBtn = btn;
            [self addSubview:_startBtn];
        }
    }
    
    return self;
}
#pragma mark
#pragma mark 
- (void)refresh:(ExamInfo_M *)examInfo_M
{
    _examNameLabel.text = KSFS(examInfo_M.testLibName);
    
    NSMutableAttributedString *timeString =[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@分钟",KSFS(examInfo_M.testDuration)]];
    [timeString addAttribute:NSForegroundColorAttributeName value:KTHEME_COLOR range:NSMakeRange(0, timeString.length -2)];
    _timeLabel.attributedText = timeString;
    
    NSMutableAttributedString *numberString =[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@题",KSFS(examInfo_M.drawQuestionNumber)]];
    [numberString addAttribute:NSForegroundColorAttributeName value:KTHEME_COLOR range:NSMakeRange(0, numberString.length -1)];
    _numberLabel.attributedText = numberString;
 
    NSMutableAttributedString *quString =[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@分",KSFS(examInfo_M.passQuestionNum)]];
    [quString addAttribute:NSForegroundColorAttributeName value:KTHEME_COLOR range:NSMakeRange(0, quString.length -1)];
    _qualifiedNumberLabel.attributedText = quString;

}
#pragma mark
#pragma mark otherACtion
- (void)bottomBtnClick
{
    if(_delegate)
    {
        [_delegate startBtnClick];
    }
}
@end
