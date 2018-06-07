//
//  SHDataService+User.h
//  SHViperDemo
//
//  Created by cdz on 2018/6/7.
//Copyright © 2018年 cdz's mac. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SHDataService.h"
#import "UserDataService.h"

NS_ASSUME_NONNULL_BEGIN
@interface SHDataService(User)<UserDataService>

//数据存入
- (void)cacheUserInfo:(UserInfoModel *)userInfo;
- (nullable UserInfoModel *)loginedUser;

//登出
- (void)logout:(void(^_Nullable)(void))completion;
//
@end
NS_ASSUME_NONNULL_END
