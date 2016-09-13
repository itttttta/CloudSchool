//
//  PDFReaderViewController.h
//  CloudSchool
//
//  Created by 汪达 on 16/9/13.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReaderDocument.h"
#import "BaseViewController.h"
@class ReaderViewController;

@protocol PDFReaderViewControllerDelegate <NSObject>

@optional // Delegate protocols

- (void)dismissReaderViewController:(ReaderViewController *)viewController;

@end


@interface PDFReaderViewController : BaseViewController
@property (nonatomic, weak, readwrite) id <PDFReaderViewControllerDelegate> delegate;

- (instancetype)initWithReaderDocument:(ReaderDocument *)object;

@end
