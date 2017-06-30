//
//  RTAPIBaseManager.h
//  QObjcTour
//
//  Created by cdzdev on 2017/6/30.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RTAPIBaseManager : NSObject

@optional
- (void)manager:(RTAPIBaseManager *)manager beforePerformSuccessWithResponse:(AIFURLResponse *)response;
- (void)manager:(RTAPIBaseManager *)manager afterPerformSuccessWithResponse:(AIFURLResponse *)response;

- (void)manager:(RTAPIBaseManager *)manager beforePerformFailWithResponse:(AIFURLResponse *)response;
- (void)manager:(RTAPIBaseManager *)manager afterPerformFailWithResponse:(AIFURLResponse *)response;

- (BOOL)manager:(RTAPIBaseManager *)manager shouldCallAPIWithParams:(NSDictionary *)params;
- (void)manager:(RTAPIBaseManager *)manager afterCallingAPIWithParams:(NSDictionary *)params;

@end

@interface RTAPIBaseManager : NSObject

@property (nonatomic, weak) id<RTAPIManagerInterceptor> interceptor;


@end
