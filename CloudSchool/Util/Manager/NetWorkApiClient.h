//
//  NetWorkApiClient.h
//  doctor
//
//  Created by 汪达 on 15/11/9.
//  Copyright © 2015年 lk. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "AFNetworking.h"

typedef enum {
    Get = 0,
    Post,
    Head,
    Put,
    Delete
} NetworkMethod;

@interface NetWorkApiClient : AFHTTPRequestOperationManager

@property (nonatomic, copy) NSString *token;

// 单例
+ (id)sharedJsonClient;
// 非单例 无Token
+ (id)changeJsonClient;


/**
 *  FormData 传数据
 *
 *  @param aPath    地址
 *  @param params   post参数
 *  @param dataDict formData参数
 *  @param block    回调
 */
- (void)requestJsonDataWithPath:(NSString *)aPath
                         params:(NSDictionary *)params
                       formDict:(NSDictionary *)formDict
                       adnBlock:(void (^)(id data, NSError *error))block;



/**
 *  API接口方法
 *
 *  @param aPath  访问路径
 *  @param params 可变字典
 *  @param method Get Post Put Delete
 *  @param block  请求回调
 */
- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(id )params
                 withMethodType:(NetworkMethod)method
                       isShowMB:(BOOL)isShowMB
                       andBlock:(void (^)(id data, NSError *error))block;

/**
 *  API接口方法
 *
 *  @param aPath  访问路径
 *  @param params 可变字典
 *  @param dataArray NSData数组
 *  @param fileName 文件名称
 *  @param block  请求回调
 */
- (void)requestJsonDataWithPath:(NSString *)aPath
                params:(NSDictionary *)params
             dataArray:(NSArray *)dataArray
              fileName:(NSString *)fileName
              adnBlock:(void (^)(id data, NSError *error))block;
@end
