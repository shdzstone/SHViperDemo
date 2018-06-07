//
//  SHDataService+ViperTest.m
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//

#import "SHDataService+ViperTest.h"
#import <AFNetworking/AFNetworking.h>

#import <objc/runtime.h>

@implementation SHDataService(ViperTest)

#pragma mark - ViperTestDataService
- (void)dataWithCompletion:(successHandler)completion failure:(failureHandler)failure {

    NSString *URLString = [NSString stringWithFormat:@"%@%@",BEE_SERVICE_ADDRESS,@"/xxx"];
    
    NSDictionary *inputParams = @{
                                  @"page_size":[NSString stringWithFormat:@"%@",@"xxx"]
                                  };
    
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithDictionary:UserInfoModel.requiredParameters];
    [param addEntriesFromDictionary:inputParams];
    
    DDLogVerbose(@"param:%@",param);
    
    [self.sharedHTTPManager GET:URLString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //        DDLogVerbose(@"response:%@",responseObject);
        
        NSDictionary *result = [responseObject objectForKey:@"result"];
        if ([[result objectForKey:@"success"] boolValue]) {
            __weak NSDictionary *dataInfo = [responseObject objectForKey:@"content"];
            if(completion){
                completion(dataInfo);
            }
        }else {
            //            DDLogVerbose(@"result:%@",result);
            
            NSString *errorMsg = [NSString stringWithFormat:@"%@",[result objectForKey:@"errorMsg"]];
            
            NSError *error = [NSError errorWithDomain:@"BEE ERROR" code:0 userInfo:@{NSLocalizedDescriptionKey:errorMsg}];
            if(failure) {
                failure(error);
            }
        }
        //*/
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
        NSInteger statusCode = response.statusCode;
        
        DDLogVerbose(@"statusCode:%ld",(long)statusCode);
        
        NSMutableDictionary *userinfo = [NSMutableDictionary dictionary];
        
        NSError *userInfoError = (NSError *)[error.userInfo objectForKey:NSUnderlyingErrorKey];
        if (userInfoError) {
            if ([userInfoError.userInfo objectForKey:NSLocalizedDescriptionKey]) {
                [userinfo setObject:[userInfoError.userInfo objectForKey:NSLocalizedDescriptionKey] forKey:NSLocalizedDescriptionKey];
            }else {
                [userinfo setObject:[NSString stringWithFormat:@" internal server error (%ld)",(long)statusCode] forKey:NSLocalizedDescriptionKey];
            }
            if ([userInfoError.userInfo objectForKey:NSURLErrorFailingURLErrorKey]) {
                [userinfo setObject:[userInfoError.userInfo objectForKey:NSURLErrorFailingURLErrorKey] forKey:NSURLErrorFailingURLErrorKey];
            }
            //        DDLogVerbose(@"errorResponse:%@",[userInfoError.userInfo objectForKey:@"com.alamofire.serialization.response.error.response"]);
            
        }else {
            [userinfo setObject:[NSString stringWithFormat:@" internal server error (%ld)",(long)statusCode] forKey:NSLocalizedDescriptionKey];
        }
        
        if (failure) {
            failure([NSError errorWithDomain:error.domain code:error.code userInfo:userinfo]);
        }
    }];
}
@end

