//
//  SHDataService.h
//  RushRabbit
//
//  Created by cdz on 2018/6/7.
//  Copyright © 2018年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;
@interface SHDataService : NSObject
+ (instancetype)sharedInsatnce;
@property(nonatomic,strong,readonly)AFHTTPSessionManager *httpManager;
//AFN Error转成本地Error提示
+ (NSError*)localErrorWithAFNError:(NSError*)error statusCode:(NSInteger)statusCode;
+ (void)respData:(id)responseObject success:(successHandler)success failure:(failureHandler)failure;
+ (void)logout;
@end
