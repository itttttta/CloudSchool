//
//  ClassCollectionView.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/10.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ClassCollectionView.h"
#import "ClassCollectionViewCell.h"
@interface ClassCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;

@end
@implementation ClassCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout createCollectionViewFlowLayoutWithScrollDirection:UICollectionViewScrollDirectionVertical
                                                                                                                  minimumY:0
                                                                                                                  minimumX:0];
    
    if(!_collectionView)
    {
        _collectionView = [UICollectionView createCollectionViewWithFrame:CGRectMake(0, 0, self.width, self.height)
                                                         collectionViewLayout:flowLayout
                                                              backgroundColor:KCOLOR_WHITE
                                                                     delegate:self
                                                                   dataSource:self];
        [_collectionView registerClass:[ClassCollectionViewCell class] forCellWithReuseIdentifier:@"ClassCollectionViewCell"];
        [self addSubview:_collectionView];
    }

    return self;
}

#pragma mark - collectionView delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ClassCollectionViewCell *cell = [[ClassCollectionViewCell alloc] init];
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"ClassCollectionViewCell" forIndexPath:indexPath];
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeZero;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([ClassCollectionViewCell getWitdh],[ClassCollectionViewCell getHeight]);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self endEditing:YES];
}

@end
