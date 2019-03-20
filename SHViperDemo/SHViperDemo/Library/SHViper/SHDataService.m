//
//  SHDataService.m
//  RushRabbit
//
//  Created by cdz on 2018/6/7.
//  Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "SHDataService.h"

#import <AFNetworking/AFNetworking.h>

@implementation SHDataService
@synthesize httpManager=_httpManager;

+ (instancetype)sharedInsatnce {
    static SHDataService *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[SHDataService alloc] init];
    });
    return shared;
}

- (AFHTTPSessionManager*)httpManager {
    if (_httpManager==nil) {
        // 初始化请求管理类
        _httpManager = [AFHTTPSessionManager manager];
        _httpManager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        // 设置15秒超时 - 取消请求
        _httpManager.requestSerializer.timeoutInterval = 15.0;
        // 编码
        _httpManager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        // 缓存策略
        _httpManager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        _httpManager.responseSerializer = [AFJSONResponseSerializer serializer];
        // 支持内容格式
        _httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    }
    
    return _httpManager;
}

+ (NSError*)localErrorWithAFNError:(NSError*)error statusCode:(NSInteger)statusCode {
    
    if (error.userInfo[NSLocalizedDescriptionKey]!=nil) {
        return error;
    }else {
        DDLogVerbose(@"statusCode:%ld",(long)statusCode);
        NSMutableDictionary *userinfo = [NSMutableDictionary dictionary];
        NSError *userInfoError = (NSError *)[error.userInfo objectForKey:NSUnderlyingErrorKey];
        if (userInfoError) {
            if ([userInfoError.userInfo objectForKey:NSLocalizedDescriptionKey]) {
                [userinfo setObject:[userInfoError.userInfo objectForKey:NSLocalizedDescriptionKey] forKey:NSLocalizedDescriptionKey];
            }else {
                [userinfo setObject:@"网络发生异常" forKey:NSLocalizedDescriptionKey];
            }
            DDLogVerbose(@"errorResponse:%@",[userInfoError.userInfo objectForKey:@"com.alamofire.serialization.response.error.response"]);
        }else {
            [userinfo setObject:@"网络发生异常" forKey:NSLocalizedDescriptionKey];
        }
        return [NSError errorWithDomain:error.domain code:error.code userInfo:userinfo];
    }
}

+ (void)respData:(id)responseObject success:(successHandler)success failure:(failureHandler)failure {
    NSDictionary *result = [(NSDictionary*)responseObject objectForKey:@"result"];
    if ([[result objectForKey:@"success"] boolValue]) {
        NSDictionary *dataInfo = [(NSDictionary*)responseObject objectForKey:@"content"];
        if(success){
            success(dataInfo);
        }
    }else {
        if ([result[@"errorCode"] integerValue]==409) {
            [SHDataService logout];
        }else {
            NSString *errorMsg = [NSString stringWithFormat:@"%@",result[@"errorMsg"]];
            NSError *error = [NSError errorWithDomain:@"Args error" code:[result[@"errorCode"] integerValue] userInfo:@{NSLocalizedDescriptionKey:errorMsg}];
            if(failure) {
                failure(error);
            }
        }
    }
}

@end
