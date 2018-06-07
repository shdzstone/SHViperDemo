//
//  SHDataService.m
//  Bee
//
//  Created by cdz on 2018/5/11.
//  Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "SHDataService.h"

#import <AFNetworking/AFNetworking.h>

@interface SHDataService()

@end

@implementation SHDataService
@synthesize sharedHTTPManager=_sharedHTTPManager;

+ (instancetype)sharedInsatnce {
    static SHDataService *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[SHDataService alloc] init];
    });
    return shared;
}

- (AFHTTPSessionManager*)sharedHTTPManager {
    if (_sharedHTTPManager==nil) {
        // 初始化请求管理类
        _sharedHTTPManager = [AFHTTPSessionManager manager];
        _sharedHTTPManager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        // 设置15秒超时 - 取消请求
        _sharedHTTPManager.requestSerializer.timeoutInterval = 15.0;
        // 编码
        _sharedHTTPManager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        // 缓存策略
        _sharedHTTPManager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        _sharedHTTPManager.responseSerializer = [AFJSONResponseSerializer serializer];
        // 支持内容格式
        _sharedHTTPManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    }
    
    return _sharedHTTPManager;
}



#pragma makr - 文档操作

+ (NSString *)_pathForLocalData {
    __weak NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    __weak NSString *path = [document stringByAppendingPathComponent:@"core"];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        NSAssert(error == nil, nil);
    });
    return path;
}

+ (NSString *)_pathForLocalDataWithFileName:(NSString *)fileName {
    NSParameterAssert(fileName);
    return [[self _pathForLocalData] stringByAppendingPathComponent:fileName];
}

@end

