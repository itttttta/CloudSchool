//
//  NetWorkManager.m
//  doctor
//
//  Created by 汪达 on 15/11/9.
//  Copyright © 2015年 lk. All rights reserved.
//

#define kSetDict(value,key) if (value)[params setObject:value forKey:key]
#define kSetFormDict(value,key) if (value)[formData setObject:value forKey:key]


#import "NetWorkManager.h"
//NSMutableDictionary *params = [NSMutableDictionary dictionary];
@interface NetWorkManager()
@property (nonatomic, copy) NSString *token;
@end
@implementation NetWorkManager

- (instancetype)init
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
//    self.token = [[[NSUserDefaults standardUserDefaults] objectForKey:KTOKENID] copy];
    return self;
}
+ (instancetype)sharedManager {
    static NetWorkManager *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
    });
    return shared_manager;
}

//获取我的课程列表
- (void)request_MyCourseListandBlock:(void (^)(id data, NSError *error))block
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setObject:@"api.south.course.get.my.list" forKey:@"TX"];
    [params setObject:@"114" forKey:@"userId"];
    [[NetWorkApiClient sharedJsonClient] requestJsonDataWithPath:@"api/exec.htm"
                                                          params:nil
                                                        formDict:params
                                                        adnBlock:^(id data, NSError *error) {
                                                            if(!error)
                                                            {
                                                                block(data,error);
                                                            }else
                                                            {
                                                                block(nil,error);
                                                            }
                                                        }];
}

//获取推荐课程
- (void)request_RecomendCoursesLandBlock:(void (^)(id data, NSError *error))block
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    kSetDict(@"114", @"userId");
    kSetDict(@"api.south.course.get.recommedation.list", @"TX");
    kSetDict(@"1", @"pageNo");
    kSetDict(@"4", @"pageSize");
    [[NetWorkApiClient sharedJsonClient] requestJsonDataWithPath:@"api/exec.htm"
                                                          params:nil
                                                        formDict:params
                                                        adnBlock:^(id data, NSError *error) {
                                                            if(!error)
                                                            {
                                                                block(data,error);
                                                            }else
                                                            {
                                                                block(nil,error);
                                                            }
                                                        }];
}
//获取课程详情
- (void)request_DetailCourseBy:(NSString *)courseID
                      andBlock:(void (^)(id data, NSError *error))block
{
    
    NSMutableDictionary * formData = [NSMutableDictionary dictionary];
    kSetFormDict(@"114", @"userId");
    kSetFormDict(@"api.south.course.get.details", @"TX");
    kSetFormDict(courseID, @"courseId");
    
    [[NetWorkApiClient sharedJsonClient] requestJsonDataWithPath:@"api/exec.htm"
                                                          params:nil
                                                        formDict:formData
                                                        adnBlock:^(id data, NSError *error) {
                                                            if(!error)
                                                            {
                                                                block(data,error);
                                                            }else
                                                            {
                                                                block(nil,error);
                                                            }
                                                        }];
}
//获取考试信息
- (void)request_ExamInfo:(NSString *)courseID
                andBlock:(void (^)(id data, NSError *error))block
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    kSetDict(@"114", @"userId");
    kSetDict(@"api.south.course.get.exam.info", @"TX");
    kSetDict(courseID, @"courseId");


    [[NetWorkApiClient sharedJsonClient] requestJsonDataWithPath:@"api/exec.htm"
                                                          params:nil
                                                        formDict:params
                                                        adnBlock:^(id data, NSError *error) {
                                                            if(!error)
                                                            {
                                                                block(data,error);
                                                            }else
                                                            {
                                                                block(nil,error);
                                                            }
                                                        }];

}
//获取考题信息
- (void)request_ExamList:(NSString *)courseID
               testLibID:(NSString *)testLibID
                andBlock:(void (^)(id data, NSError *error))block
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    kSetDict(@"114", @"userId");
    kSetDict(@"api.south.course.get.exam.question", @"TX");
    kSetDict(courseID, @"courseId");
    kSetDict(testLibID, @"testLibId");

    
    [[NetWorkApiClient sharedJsonClient] requestJsonDataWithPath:@"api/exec.htm"
                                                          params:nil
                                                        formDict:params
                                                        adnBlock:^(id data, NSError *error) {
                                                            if(!error)
                                                            {
                                                                block(data,error);
                                                            }else
                                                            {
                                                                block(nil,error);
                                                            }
                                                        }];
    
}

//测试专用
- (void)request_textGetandBlock:(void (^)(id data, NSError *error))block
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [[NetWorkApiClient sharedJsonClient] requestJsonDataWithPath:@"api/doctor/friend2MeRequestList"
                                                      withParams:params
                                                  withMethodType:Get
                                                        isShowMB:YES
                                                        andBlock:^(id data, NSError *error) {
                                                            if(!error)
                                                            {
                                                                block(data,error);
                                                            }else
                                                            {
                                                                block(nil,error);
                                                            }
                                                        }];
}


@end
