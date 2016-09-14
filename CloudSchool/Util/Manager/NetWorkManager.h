//
//  NetWorkManager.h
//  doctor
//
//  Created by 汪达 on 15/11/9.
//  Copyright © 2015年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkApiClient.h"

@interface NetWorkManager : NSObject

/**
 *  初始化
 *
 *  @return 单例
 */
+ (instancetype)sharedManager;



/**
 *  获取我的课程列表
 *
 *  @param block block
 */
- (void)request_MyCourseListandBlock:(void (^)(id data, NSError *error))block;



/**
 *  获取推荐课程
 *
 *  @param block block
 */
- (void)request_RecomendCoursesLandBlock:(void (^)(id data, NSError *error))block;


/**
 *  获取课程详情
 *
 *  @param block block
 */
- (void)request_DetailCourseBy:(NSString *)courseID
                      andBlock:(void (^)(id data, NSError *error))block;


/**
 *  获取考试信息
 *
 *  @param block block
 */
- (void)request_ExamInfoandBlock:(void (^)(id data, NSError *error))block;

/**
 *  崩溃日志
 *
 *  @param params 参数字典
 *  @param block  回调
 */
- (void)request_CrashLogWithParams:(NSDictionary *)params
                          andBlock:(void (^)(id data, NSError *error))block;


@end


