//
//  NetWorkApiClient.m
//  doctor
//
//  Created by 汪达 on 15/11/9.
//  Copyright © 2015年 lk. All rights reserved.
//

//#define WDAssertError(condition, msg) \
//if ((condition) == NO) { \
//    Dlog(msg);\
//    break;\
//}

#define kNetworkMethodName @[@"Get", @"Post", @"Put", @"Delete"]

//
#ifdef DEBUG
#define BaseUrl  @"http://192.168.0.34:8080/"

#else
#define BaseUrl  @"http://lincon.com.cn/"
#endif

#import "NetWorkApiClient+Animation.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "NetWorkApiClient.h"
#import "BaseNavViewController.h"

@interface NetWorkApiClient ()<UIAlertViewDelegate>
@property (nonatomic, strong) UIAlertView *alertView;

@end
@implementation NetWorkApiClient

static NetWorkApiClient *_sharedClient = nil;
static dispatch_once_t onceToken;
+ (NetWorkApiClient *)sharedJsonClient {
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NetWorkApiClient alloc] initWithBaseURL:[NSURL URLWithString:BaseUrl]];
    });
    return _sharedClient;
}

+ (id)changeJsonClient{
    _sharedClient = [[NetWorkApiClient alloc] initWithWithOutToken:[NSURL URLWithString:BaseUrl]];
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
//    self.token = [[[NSUserDefaults standardUserDefaults] objectForKey:KTOKENID] copy];
    [self.reachabilityManager startMonitoring];
//    [self.requestSerializer setValue:self.token forHTTPHeaderField:KTOKENID];
    self.requestSerializer.timeoutInterval = 10;
    self.securityPolicy.allowInvalidCertificates = YES;
    AFNetworkActivityIndicatorManager *netactivity = [AFNetworkActivityIndicatorManager sharedManager];
    netactivity.enabled = YES;
    return self;
}
- (id)initWithWithOutToken:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
    [self.reachabilityManager startMonitoring];
    self.requestSerializer.timeoutInterval = 10;
    self.securityPolicy.allowInvalidCertificates = YES;
    AFNetworkActivityIndicatorManager *netactivity = [AFNetworkActivityIndicatorManager sharedManager];
    netactivity.enabled = YES;
    return self;
}


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
                       adnBlock:(void (^)(id data, NSError *error))block
{
    if (!aPath || aPath.length <= 0) {
        DLog(@"api error");
        return;
    }
    //log请求数据
    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self POST:aPath
    parameters:params
    constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFormData:[formDict mj_JSONData] name:@"requestData"];
    }
       success:^(AFHTTPRequestOperation *operation, id responseObject) {
           DLog(@"%@", operation.response);
           DLog(@"JSON:\n %@", responseObject);
           if ([responseObject isKindOfClass:[NSDictionary class]]) {
               block(responseObject, nil);
           }
       }
       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
           block(operation, error);
       }];
}


- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(id )params
                 withMethodType:(NetworkMethod)method
                       isShowMB:(BOOL)isShowMB
                       andBlock:(void (^)(id data, NSError *error))block{
    
    
    
    
    if(self.reachabilityManager.networkReachabilityStatus  == AFNetworkReachabilityStatusNotReachable)
    {
        [self AnimationShowHint:@"网络连接异常,请检查网络设置" delay:2.0];
        block(nil,nil);
        return ;
    }
    
    DLog(@"self.reachabilityManager = %@",self.reachabilityManager)
    
    
    if (!aPath || aPath.length <= 0) {
        DLog(@"api error");
        return;
    }
    NSAssert(aPath, @"访问路径不能为空");
    if(isShowMB)
    {
        [self AnimationShow];
    }
    //log请求数据
    DLog(@"\n===========request===========\n%@\n%@:\n%@", kNetworkMethodName[method], aPath, params);
    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    发起请求
    switch (method) {
        case Get:{
            [self GET:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                dispatch_main_async_safe(^{
                    if(isShowMB)
                    {
                        [self AnimationHidden];
                    }
                    DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
                        //判断数据是否符合预期，给出提示
                        block(responseObject, nil);
                    }
                });
              
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               
                if(isShowMB)
                {
                    [self AnimationHidden];
                }
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                dispatch_main_async_safe(^{
                    block(operation, error);
                });
            }];
            break;
        }
        case Post:{
            NSAssert(params, @"参数不能为空");
            [self POST:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                dispatch_main_async_safe(^{
                    if(isShowMB)
                    {
                        [self AnimationHidden];
                    }
                    DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
                        block(responseObject, nil);
                    }
                });
              
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                if(isShowMB)
                {
                    [self AnimationHidden];
                }
            }];
            break;
        }
        case Put:{
            [self PUT:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                if(isShowMB)
                {
                    [self AnimationHidden];
                }
                DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    block(responseObject, nil);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                if(isShowMB)
                {
                    [self AnimationHidden];
                }
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                block(operation, error);
            }];
            break;}
        case Delete:{
            [self DELETE:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                if(isShowMB)
                {
                    [self AnimationHidden];
                }
                DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    block(responseObject, nil);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                if(isShowMB)
                {
                    [self AnimationHidden];
                }
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                block(operation, error);
            }];
        }
        default:
            break;
    }
}




- (void)requestJsonDataWithPath:(NSString *)aPath
                         params:(NSDictionary *)params
                      dataArray:(NSArray *)dataArray
                       fileName:(NSString *)fileName
                       adnBlock:(void (^)(id data, NSError *error))block
{
    if (!aPath || aPath.length <= 0) {
        DLog(@"api error");
        return;
    }
    //log请求数据
    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self POST:aPath
        parameters:params
constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    if(dataArray.count >1)
    {
        for (NSInteger i = 0; i<[dataArray count]; i++)
        {
            [formData appendPartWithFileData:dataArray[i]
                                        name:[NSString stringWithFormat:@"%@_%ld",fileName,(long)i]
                                    fileName:[NSString stringWithFormat:@"image%ld.jpg",(long)i]
                                    mimeType:@"image/jpg"];
        }
    }else if(dataArray.count ==1)
    {
        [formData appendPartWithFileData:dataArray[0]
                                    name:[NSString stringWithFormat:@"%@",fileName]
                                fileName:[NSString stringWithFormat:@"image.jpg"]
                                mimeType:@"image/jpg"];
    }
    
}
           success:^(AFHTTPRequestOperation *operation, id responseObject) {
               DLog(@"%@", operation.response);
               DLog(@"JSON: %@", responseObject);
               DLog(@"\n message = %@",responseObject[@"message"]);
               if ([responseObject isKindOfClass:[NSDictionary class]]) {
                   block(responseObject, nil);
               }
           }
           failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               block(operation, error);
           }];
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex)
    {
//        [[NSUserDefaults standardUserDefaults] removeObjectForKey:KTOKENID];
//        [[NSUserDefaults standardUserDefaults] removeObjectForKey:KACCOUNTID];
//        [[NSUserDefaults standardUserDefaults] removeObjectForKey:KPHONE];
//        [[NSUserDefaults standardUserDefaults] removeObjectForKey:KREALNAME];
//        [[NSUserDefaults standardUserDefaults] removeObjectForKey:KUNIONLOGININFO];
//        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"totalUnreadCount"]) {
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"totalUnreadCount"];
//        }
//        [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
//        UIViewController *vc = nil;
//        vc = [[LoginViewController alloc] init];
//        BaseNavViewController *nav = [[BaseNavViewController alloc] initWithRootViewController:vc];
//        UIViewController *present = [self getCurrentVC];
//        [present presentViewController:nav animated:YES completion:nil];
    }
}
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

@end
